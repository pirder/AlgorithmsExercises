//
//  ThreadCountTest.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/10.
//

import Foundation

class ThreadCountTest {
    
    static func getThreadCount()  {
        var kr:kern_return_t =  0
        var thread_list = thread_act_array_t(bitPattern: 0)
        var thread_count = mach_msg_type_number_t(0)//UInt32
        kr = task_threads(mach_task_self_, &thread_list, &thread_count)
        if kr != KERN_SUCCESS {
            return
        }
        SALog("线程数目\(thread_count)")
        let size =  Int(thread_count) * MemoryLayout<thread_t>.size
        kr = vm_deallocate(mach_task_self_, vm_address_t(bitPattern: thread_list), vm_size_t(size))
        if kr != KERN_SUCCESS {
            return
        }
        return
    }

    static func testGCDThreadCount(){
        
        let semaphore = DispatchSemaphore.init(value: 1)
        var set = Set<Thread>()
        for _ in 0..<1000 {
            let queue = DispatchQueue.global()
            
            queue.async {
                let thread = Thread.current
                semaphore.wait()
                set.insert(thread)
                semaphore.signal()
                DispatchQueue.main.async {
                    SALog("开始\(thread)")
                    SALog("GCD 创建的现场数量 \(set.count)")
                    getThreadCount()
                }
                Thread.sleep(forTimeInterval: 10)
                semaphore.wait()
                set.remove(thread)
                semaphore.signal()

                SALog("结束\(thread)")
                return
            }
            
        }
    }
    
}

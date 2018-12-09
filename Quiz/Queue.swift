//
//  Queue.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import Foundation

struct Queue<Value> {
    
    private var values: [Value] = []
    
    private let semaphore = DispatchSemaphore(value: 0)
    
    mutating func push(_ new: Value) {
                
        values.insert(new, at: 0)
        
        semaphore.signal()
    }
    
    mutating func pop() -> Value {
        
        semaphore.wait()
        
        return values.popLast()!
    }
}

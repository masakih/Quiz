//
//  QueueTest.swift
//  QuizTests
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import XCTest

class QueueTest: XCTestCase {

    func testExample() {
        
        let ex = expectation(description: "hoge")
        
        var queue = Queue<Int>()
        
        DispatchQueue.global().async {
            
            let v = queue.pop()
            
            XCTAssertEqual(v, 1)
            
            ex.fulfill()
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            
            queue.push(1)
        }
        
        waitForExpectations(timeout: 1)
    }
    
    func testMulti() {
        
        var queue = Queue<Int>()
        
        queue.push(0)
        queue.push(1)
        queue.push(2)
        queue.push(3)
        
        XCTAssertEqual(queue.pop(), 0)
        XCTAssertEqual(queue.pop(), 1)
        XCTAssertEqual(queue.pop(), 2)
        XCTAssertEqual(queue.pop(), 3)
    }

}

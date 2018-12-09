//
//  QuestionLoaderTest.swift
//  QuizTests
//
//  Created by Hori,Masaki on 2018/12/08.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import XCTest
@testable import Quiz

class QuestionLoaderTest: XCTestCase {
    
    func testMock() {
        
        let loader = MockQuestionLoader()
        
        var count = 0
        (0..<100).forEach { _ in
            
            loader.load { q in
                
                count += 1
            }
        }
        
        XCTAssertEqual(count, 100)
    }
    
    func testLocal() {
        
        let loader = LocalQuestionLoader()
        
        var count = 0
        (0..<100).forEach { _ in
            
            loader.load { q in
                
                count += 1
            }
        }
        
        XCTAssertEqual(count, 100)
    }
}

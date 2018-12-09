//
//  CodableQuestionTest.swift
//  QuizTests
//
//  Created by Hori,Masaki on 2018/12/09.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import XCTest
@testable import Quiz

class CodableQuestionTest: XCTestCase {
    
    func testCodableQuestion() {
        
        let json = """
{
"text": "もんだい",
"answers": [
    "こたえ１",
    "こたえ２",
    "こたえ３",
    "こたえ４"
]
}
"""
        
        do {
            let data = json.data(using: .utf8)
            let q = try JSONDecoder().decode(CodableQuestion.self, from: data!)
            
            XCTAssertNoThrow(try q.convert())
            
        }
        catch {
            
            XCTFail("hoge? \(error)")
        }
        
        let json2 = """
[
    {
        "text": "もんだい１",
        "answers": [
            "こたえ１",
            "こたえ２",
            "こたえ３",
            "こたえ４"
        ]
    },
    {
        "text": "もんだい１",
        "answers": [
            "こたえ１",
            "こたえ２",
            "こたえ３",
            "こたえ４"
        ]
    }
]
"""
        
        do {
            let data = json2.data(using: .utf8)
            let qs = try JSONDecoder().decode([CodableQuestion].self, from: data!)
            XCTAssertEqual(qs.count, 2)
            
            XCTAssertNoThrow(try qs.map( { try $0.convert() }))
            
        }
        catch {
            
            XCTFail("hoge? \(error)")
        }
    }
}

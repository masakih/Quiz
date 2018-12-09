//
//  QuizTests.swift
//  QuizTests
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import XCTest
@testable import Quiz

class QuizTests: XCTestCase {
    
    func testQuestion() {
        
        let answerTexts = [
        "こたえ１",
        "こたえ２",
        "こたえ３",
        "こたえ４"
        ]
        
        do {
            
            let answers = zip(answerTexts, 0...)
                .map { ($0.0, $0.1 == 0) }
                .map(Question.Answer.init)
            
            XCTAssertNoThrow(try Question(text: "もんだい", answers: answers))
            
        }
        
        do {
            
            let answers = answerTexts
                .map { ($0, true) }
                .map(Question.Answer.init)
            
            XCTAssertThrowsError(try Question(text: "もんだい", answers: answers))
        }
        
        do {
            
            let answers = answerTexts
                .map { ($0, false) }
                .map(Question.Answer.init)
            
            XCTAssertThrowsError(try Question(text: "もんだい", answers: answers))
        }
        
        do {
            
            let answers = zip(answerTexts, 0...)
                .map { ($0.0, $0.1 == 0) }
                .map(Question.Answer.init)
                .prefix(3)
            
            XCTAssertThrowsError(try Question(text: "もんだい", answers: Array(answers)))
        }
        
        do {
            
            let answers = zip(answerTexts + answerTexts, 0...)
                .map { ($0.0, $0.1 == 0) }
                .map(Question.Answer.init)
                .prefix(5)
            
            XCTAssertThrowsError(try Question(text: "もんだい", answers: Array(answers)))
        }
        
    }
}


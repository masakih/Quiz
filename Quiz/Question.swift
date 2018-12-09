//
//  Question.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//


enum QuestionError: Error {
    
    case answersCountNotFour
    
    case correcetCountNotOne
}

struct Question {
    
    struct Answer: Equatable {
        
        let text: String
        
        let correct: Bool
    }
    
    let text: String
    
    let answers: [Answer]
    
    init(text: String, answers: [Answer]) throws {
        
        guard answers.count == 4 else {
            
            throw QuestionError.answersCountNotFour
        }
        
        guard answers.filter({ $0.correct }).count == 1 else {
            
            throw QuestionError.correcetCountNotOne
        }
        
        self.text = text
        self.answers = answers.shuffled()
    }
}

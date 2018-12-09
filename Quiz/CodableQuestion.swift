//
//  CodableQuestion.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

/// 問題集をJSONから取り出すためのstruct
/// 1つ目の答えが正解でなければならない
struct CodableQuestion: Codable {
    
    let text: String
    
    let answerTexts: [String]
    
    enum CodingKeys: String, CodingKey {
        
        case text
        
        case answerTexts = "answers"
    }
}

extension CodableQuestion {
    
    func convert() throws -> Question {
        
        let answers = zip(answerTexts, 0...)
            .map { ($0.0, $0.1 == 0) }
            .map(Question.Answer.init)
        
        return try Question(text: text, answers: answers)
    }
}

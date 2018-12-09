//
//  LocalQuestionLoader.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/08.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import Foundation

class LocalQuestionLoader: QuestionLoader {
    
    private var questions: [Question]
    private var cursor = 0
    private let questionCount: Int
    
    init() {
        
        questions = LocalQuestionLoader.load()
        questionCount = questions.count
    }
    
    private static func load() -> [Question] {
        
        guard let jsonPath = Bundle.main.url(forResource: "Questions", withExtension: "json"),
            let jsonData = try? Data(contentsOf: jsonPath),
            let codableQuestions = try? JSONDecoder().decode([CodableQuestion].self, from: jsonData),
            let questions = try? codableQuestions.map({ try $0.convert() }) else {
            
            fatalError("Can not load questions.json")
        }
        
        return questions
    }
    
    func load(_ completion: (Question) -> Void) {
        
        if questionCount <= cursor {
            
            cursor = 0
        }
        
        completion(questions[cursor])
        
        cursor += 1
    }
}

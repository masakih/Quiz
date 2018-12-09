//
//  SingleQuestionStack.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//


class SingleQuestionStack: QuestionStack {
    
    private var questions = Queue<Question>()
    
    private let loader: QuestionLoader
    
    init(_ loader: QuestionLoader) {
        
        self.loader = loader
        
        loadQuestion()
    }
    
    func pop() -> Question {
        
        defer { loadQuestion() }
        
        return questions.pop()
    }
    
    private func loadQuestion() {
        
        loader.load { question in
            
            self.questions.push(question)
        }
    }
}

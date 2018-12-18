//
//  GameMaster.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//


class GameMaster {
    
    private let questionStack: QuestionStack
    
    private let count: Int
    private var currentIndex = 0
    
    var didClear: Bool {
        
        return currentIndex >= count
    }
    
    init(count: Int = 10, _ questionStack: QuestionStack) {
        
        self.questionStack = questionStack
        self.count = count
    }
    
    func next() -> Question? {
        
        if didClear { return nil }
        
        currentIndex += 1
        
        return questionStack.pop()
    }
}

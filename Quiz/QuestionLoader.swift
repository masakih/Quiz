//
//  QuestionLoader.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//


protocol QuestionLoader {
    
    func load(_ completion: (Question) -> Void)
}

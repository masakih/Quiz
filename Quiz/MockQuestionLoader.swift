//
//  MockQuestionLoader.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/08.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import Foundation

class MockQuestionLoader: QuestionLoader {
    
    func load(_ completion: (Question) -> Void) {
        
        
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
            
            let qq = try q.convert()
            
            completion(qq)
            
        }
        catch {
            
            fatalError("Can not load question.")
        }
    }
}

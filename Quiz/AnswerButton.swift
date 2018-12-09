//
//  AnswerButton.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import UIKit

class AnswerButton: UIButton {

    var answer: Question.Answer? {
        
        didSet {
            
            setTitle(answer?.text, for: .normal)
        }
    }
}

//
//  ViewController.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet private weak var questionLabel: UILabel?
    
    @IBOutlet private weak var button01: AnswerButton?
    @IBOutlet private weak var button02: AnswerButton?
    @IBOutlet private weak var button03: AnswerButton?
    @IBOutlet private weak var button04: AnswerButton?
    
    var question: Question? {
        
        didSet { validate() }
    }
    
    var completor: ((Question, Bool) -> Void)?
    
    private func validate() {
        
        questionLabel?.text = question?.text
        
        button01?.answer = question?.answers[0]
        button02?.answer = question?.answers[1]
        button03?.answer = question?.answers[2]
        button04?.answer = question?.answers[3]
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        validate()
    }
    
    @IBAction private func answer(_ button: AnswerButton) {
        
        guard let q = question, let c = button.answer?.correct else {
            
            fatalError("Missing Question.")
        }
        
        completor?(q, c)
    }
}

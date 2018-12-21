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
    
    private var allButton: [AnswerButton] {
        
        return [button01, button02, button03, button04].compactMap { $0 }
    }
    
    var completor: ((Question, Question.Answer) -> Void)?
    
    private func validate() {
        
        questionLabel?.text = question?.text
        
        zip(allButton, question?.answers ?? [])
            .forEach { button, answer in
                
                button.answer = answer
            }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        validate()
    }
    
    @IBAction private func answer(_ button: AnswerButton) {
        
        guard let q = question, let a = button.answer else {
            
            fatalError("Missing Question.")
        }
        
        completor?(q, a)
    }
}

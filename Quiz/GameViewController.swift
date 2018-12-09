//
//  ViewController.swift
//  Quiz
//
//  Created by Hori,Masaki on 2018/12/07.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import UIKit

func createGameMaster() -> GameMaster {
    
    return GameMaster(count: 10, SingleQuestionStack(LocalQuestionLoader()))
}

class GameViewController: UIViewController {
    
    private var gameMaster = createGameMaster()
    
    @IBOutlet private weak var button: UIButton?
    
    @IBOutlet private weak var label: UILabel?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc = segue.destination as? QuestionViewController else {
            
            return
        }
        
        vc.question = gameMaster.next()
        
        vc.completor = { question, isCorrect in
            
            defer {
                
                vc.dismiss(animated: true, completion: {})
            }
            
            guard self.gameMaster.canNext else {
                
                self.showCleared()
                
                return
            }
                        
            if isCorrect {
                
                self.showCorrect(question)
                
            } else {
                
                self.showIncorrect(question)
            }
        }
    }
    
    private func showCleared() {
        
        gameMaster = createGameMaster()
        
        button?.setTitle("もう一度", for: .normal)
        label?.text = "おめでとうございます。\n10問連続正解しました。"
    }
    
    private func showCorrect(_ question: Question) {
        
        button?.setTitle("次のクイズ", for: .normal)
        label?.text = "正解です。"
    }
    
    private func showIncorrect(_ question: Question) {
        
        gameMaster = createGameMaster()
        
        let correctAnswer = question.answers.first { $0.correct }
        
        button?.setTitle("最初から", for: .normal)
        label?.text = "不正解\n正解は「\(correctAnswer!.text)」です。"
    }
}

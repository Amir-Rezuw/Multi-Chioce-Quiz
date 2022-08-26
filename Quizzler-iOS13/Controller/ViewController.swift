//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var Chioces: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = MultiChoiceBrain()
    var scoreModel = ScoreModel()
    
    
    func updateButtons () -> Void {
        for (index, button) in Chioces.enumerated()  {
            button.backgroundColor = UIColor.clear
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.init(red: 0, green: 209, blue: 223, alpha:1).cgColor
            button.setTitle(quizBrain.getChioceText(index), for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = 5
        updateButtons()
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!.lowercased()
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if(userGotItRight){
            sender.layer.borderColor = UIColor.green.cgColor
        } else {
            sender.layer.borderColor = UIColor.red.cgColor
        }
        
        scoreModel.updateUserScore(userGotItRight)
        scoreLabel.text = "Your score is: \(scoreModel.userScore)"
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo:nil , repeats: false)
        quizBrain.nextQuestion()
        if(quizBrain.questionNumber == 0){
            scoreLabel.text = "Your score is: 0"
            scoreModel.resetScore()
        }
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        falseButton.layer.borderColor = UIColor.init(red: 0, green: 209, blue: 223, alpha:1).cgColor
        trueButton.layer.borderColor = UIColor.init(red: 0, green: 209, blue: 223, alpha:1).cgColor
        progressBar.progress = quizBrain.getProgress()
        updateButtons()
    }
    
}


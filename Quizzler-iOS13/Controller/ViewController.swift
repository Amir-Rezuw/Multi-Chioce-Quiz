//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    var scoreModel = ScoreModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        questionLabel.text = quizBrain.getQuestionText()
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!.lowercased()
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if(userGotItRight){
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
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
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    
}


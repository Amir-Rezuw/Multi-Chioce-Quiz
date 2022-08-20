//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var questionIndex = 0;
    let questionArray = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 sqmetres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, youtechnically entitled to a state funeral, because the building is consideredsacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animathe African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.",a:"False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ouncesenough to kill a small dog.", a: "True")

    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        questionLabel.text = questionArray[questionIndex].questionText
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        if(questionIndex == questionArray.count - 1){
            questionIndex = 0
        } else {
            questionIndex += 1
        }
        if(sender.currentTitle?.lowercased() == questionArray[questionIndex].answer.lowercased()){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo:nil , repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = questionArray[questionIndex].questionText
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionIndex + 1)/Float(questionArray.count)
    }
    
}


//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by AmirReza Jamali on 8/20/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain {
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
    var questionNumber = 0;
    func checkAnswer(_ userAnswer :String) -> Bool{
        if userAnswer.lowercased() == questionArray[questionNumber].answer.lowercased(){
            return true
        } else{
            return false
        }
    }
    
    func getQuestionText () -> String {
        return questionArray[questionNumber].questionText
    }
    func getProgress () -> Float {
        return Float(questionNumber + 1 ) / Float(questionArray.count)
    }
    
    mutating func nextQuestion () -> Void {
        if questionNumber == questionArray.count - 1 {
            questionNumber = 0
        } else {
            questionNumber += 1
        }
    }
}

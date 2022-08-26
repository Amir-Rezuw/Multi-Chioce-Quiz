//
//  MultipleChoiceModel.swift
//  Quizzler-iOS13
//
//  Created by AmirReza Jamali on 8/26/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct MultiChoiceBrain {
    let questionArray = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")]
    var questionNumber:Int = 0;
    func checkAnswer(_ userAnswer :String) -> Bool{
        if userAnswer.lowercased() == questionArray[questionNumber].correctAnswer.lowercased(){
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
    func getChioceText (_ index:Int) -> String{
        return questionArray[questionNumber].answer[index]
    }
}

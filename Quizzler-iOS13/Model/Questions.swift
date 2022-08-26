//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by AmirReza Jamali on 8/16/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var questionText: String
    var  answer: [String]
    var correctAnswer: String
    
    init(q:String, a:[String], correctAnswer:String){
        questionText = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}

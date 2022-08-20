//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by AmirReza Jamali on 8/16/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var questionText:String
    var  answer:String
    
    
    init(q:String,a:String){
        questionText = q
        answer = a
    }
}

//
//  SummaryModel.swift
//  Trivia App
//
//  Created by Gaurav Thakur on 03/09/20.
//  Copyright © 2020 Gaurav Kumar Thakur. All rights reserved.
//

import Foundation

struct SummaryModel {
    
    var title = ""
    var givenAnswerText = ""
    var question1 = ""
    var answertext = ""
    var question2 = ""
    var hellotext = ""
    
    init() {
        title = "Summary"
        givenAnswerText = "Here are the answers selected:"
        question1 = "Who is the best cricketer in the world?"
        question2 = "What are the colors in the national flag?"
        answertext = "Answer: "
        hellotext = "Hello - "
        
    }
}

//
//  Question.swift
//  QuizzlerApp
//
//  Created by Usha Sai Chintha on 05/09/22.
//

import Foundation

struct Question{
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}

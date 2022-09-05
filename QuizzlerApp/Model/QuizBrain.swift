//
//  QuizBrain.swift
//  QuizzlerApp
//
//  Created by Usha Sai Chintha on 05/09/22.
//

import Foundation

struct QuizBrain{
    let quizQuestions = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    var score=0
    
    // to make the code even simpler while calling below function, external parameter name can be _, so when calling there is no need to pass parameter name
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quizQuestions[questionNumber].answer{
            score+=1
            return true
        } else{
            return false
        }
    }
    
    func getQuestionText() -> String{
        return quizQuestions[questionNumber].text
    }
    
    func getProgressValue() -> Float{
        return Float(questionNumber+1)/Float(quizQuestions.count)
    }
    
    func getScoreValue() -> Int{
        return score
    }
    
    mutating func repeatingQuestions(){
        if questionNumber<quizQuestions.count-1 {
            questionNumber += 1
        }else{
            questionNumber=0
            score=0
        }
    }
}

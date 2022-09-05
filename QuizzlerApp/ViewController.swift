//
//  ViewController.swift
//  QuizzlerApp
//
//  Created by Usha Sai Chintha on 04/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // data type of quizQuestions is array of Question struct i.e [Question]
    let quizQuestions = [Question(text: "4+2 = 6", answer: "True"), Question(text: "8-3 = 5", answer: "True"), Question(text: "6+3 = 8", answer: "False")]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionsOnUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answerChoosen = sender.currentTitle!
        let actualAnswer = quizQuestions[questionNumber].answer
        if answerChoosen == actualAnswer{
            print("Right:)")
        } else{
            print("Wrong:(")
        }
        
        if questionNumber<quizQuestions.count-1 {
           questionNumber += 1
        }else{
            questionNumber=0
        }
        
        updateQuestionsOnUI()

    }
    
    func updateQuestionsOnUI(){
        questionLabel.text = quizQuestions[questionNumber].text
    }
}


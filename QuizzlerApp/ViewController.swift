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
    
    // data type of quizQuestions is 2D array of string i.e [[String]]
    let quizQuestions = [["4+2 = 6", "True"], ["8-3 = 5", "True"], ["6+3 = 8", "False"]]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionsOnUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answerChoosen = sender.currentTitle!
        let actualAnswer = quizQuestions[questionNumber][1]
        if answerChoosen == actualAnswer{
            print("Right:)")
        } else{
            print("Wrong:(")
        }
        
        print(questionNumber)
        if questionNumber<quizQuestions.count-1 {
           questionNumber += 1
        }else{
            questionNumber=0
        }
        
        updateQuestionsOnUI()

    }
    
    func updateQuestionsOnUI(){
        questionLabel.text = quizQuestions[questionNumber][0]
    }
}


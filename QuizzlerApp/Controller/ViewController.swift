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
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionsOnUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answerChoosen = sender.currentTitle!
        let status = quizBrain.checkAnswer(answer: answerChoosen)
        
        if status{
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.repeatingQuestions()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestionsOnUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateQuestionsOnUI(){
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgressValue()
    }
}


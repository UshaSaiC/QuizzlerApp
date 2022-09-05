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
    @IBOutlet weak var scoreValue: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionsOnUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answerChoosen = sender.currentTitle!
        let status = quizBrain.checkAnswer(answerChoosen)
        
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
        scoreValue.text = "Score: \(quizBrain.getScoreValue())" 
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgressValue()
    }
}


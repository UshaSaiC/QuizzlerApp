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
    
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!    
    @IBOutlet weak var thirdOption: UIButton!
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
        firstOption.setTitle(quizBrain.getFirstOptionText(), for: .normal)
        secondOption.setTitle(quizBrain.getSecondOptionText(), for: .normal)
        thirdOption.setTitle(quizBrain.getThirdOptionText(), for: .normal)
        scoreValue.text = "Score: \(quizBrain.getScoreValue())" 
        firstOption.backgroundColor = UIColor.clear
        secondOption.backgroundColor = UIColor.clear
        thirdOption.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgressValue()
    }
}


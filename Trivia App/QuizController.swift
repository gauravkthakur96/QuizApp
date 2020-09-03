//
//  QuizController.swift
//  Trivia App
//
//  Created by Gaurav Thakur on 02/09/20.
//  Copyright © 2020 Gaurav Kumar Thakur. All rights reserved.
//

import UIKit

struct Questions {
    var question: String
    var answers: [String]
    var answer: Any
    var mcq: Bool
}

class QuizController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    var questions = [Questions]()
    var qNumber = Int()
    var questionAnswered = false
    
    var storedata: [String] = []
    var answerString: [String] = []
    var mcqs = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 15

        questions = [Questions(question: "Who is the best cricketer in the world?", answers: ["Sachin Tendulkar","Virat Kolli","Adam Gilchirst","Jacques Kallis"], answer: 1, mcq: false), Questions(question: "What are the colors in the Indian national flag?", answers: ["White","Yellow","Orange","Green"], answer: [1,2,3,4], mcq: true) ]
        // Do any additional setup after loading the view.
        quizQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func quizQuestions() {
        if questions.count > 0 {
            qNumber = 0
            
            questionLabel.text = questions[qNumber].question
            
            for i in 0..<buttons.count {
                buttons[i].setTitle(questions[qNumber].answers[i], for: .normal)
                answerString = questions[qNumber].answers
                mcqs = questions[qNumber].mcq
            }
            questions.remove(at: qNumber)
            
        }
        else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
            nextViewController.storedata = self.storedata
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if mcqs == false {
            for i in buttons {
                i.isEnabled = true
            }
        }
        quizQuestions()
    }
    
    func checkButtonAndDisableit() -> Bool {
        if questionAnswered == true && mcqs == false {
            for i in buttons {
                i.isEnabled = false
            }
            return true
        }
        return false
    }
    
    @IBAction func option1Pressed(_ sender: Any) {
        if  checkButtonAndDisableit() {
            return
        }
        questionAnswered = true
        for i in answerString {
            if i == answerString[0] {
               storedata.append(i)
            }
            
        }
        print(storedata)
    }
    
    @IBAction func option2Pressed(_ sender: Any) {
        if  checkButtonAndDisableit() {
            return
        }

        questionAnswered = true
        for i in answerString {
            if i == answerString[1] {
                storedata.append(i)
            }
        }
        print(storedata)
    }
    
    @IBAction func option3Pressed(_ sender: Any) {
        if  checkButtonAndDisableit() {
            return
        }

        questionAnswered = true
        for i in answerString {
            if i == answerString[2] {
                storedata.append(i)
            }
        }
        print(storedata)
    }
        
    @IBAction func option4Pressed(_ sender: Any) {
        if  checkButtonAndDisableit() {
            return
        }

        questionAnswered = true
        for i in answerString {
            if i == answerString[3] {
                storedata.append(i)
            }
        }
        print(storedata)
    }
}

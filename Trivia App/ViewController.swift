//
//  ViewController.swift
//  Trivia App
//
//  Created by Gaurav Thakur on 02/09/20.
//  Copyright © 2020 Gaurav Kumar Thakur. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    var storedata: [String] = []
    
    var answers: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTextView.delegate = self
        setupViews()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textFieldShouldClear(answerTextView)
        storedata = []
    }
    
    func setupViews() {
        mainView.layer.cornerRadius = 15
        nextBtn.layer.cornerRadius = 15
        
        questionLabel.font = .boldSystemFont(ofSize: 24)
        answerTextView.font = .systemFont(ofSize: 20)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        guard let name = answerTextView.text else { return }
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "QuizController") as! QuizController
        storedata.append(name)
        nextViewController.storedata = self.storedata
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    

}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text!.removeAll()
        return true
    }
}


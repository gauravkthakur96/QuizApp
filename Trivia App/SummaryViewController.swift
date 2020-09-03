//
//  SummaryViewController.swift
//  Trivia App
//
//  Created by Gaurav Thakur on 03/09/20.
//  Copyright © 2020 Gaurav Kumar Thakur. All rights reserved.
//

import UIKit
import CoreData

class SummaryViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var helloLbl: UILabel!
    @IBOutlet weak var answersGivenLbl: UILabel!
    @IBOutlet weak var questionOneLbl: UILabel!
    @IBOutlet weak var answeOneLbl: UILabel!
    @IBOutlet weak var questionTwoLbl: UILabel!
    @IBOutlet weak var answerTwoLbl: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var historyBtn: UIButton!
    
    var storedata: [String?] = []
    var model = SummaryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.layer.cornerRadius = 12
        setupLabels()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupLabels() {
        if storedata.indices.contains(3) {
            storedata.append("")
        }
        if !storedata.indices.contains(4) {
            storedata.append("")
        }
        if !storedata.indices.contains(5) {
            storedata.append("")
        }
        titleLabel.text = model.title
        helloLbl.text = model.hellotext + "\(storedata[0] ?? "")"
        answersGivenLbl.text = model.givenAnswerText
        questionOneLbl.text = model.question1
        answeOneLbl.text = model.answertext + "\(storedata[1] ?? "")"
        questionTwoLbl.text = model.question2
        answerTwoLbl.text = model.answertext + "\(storedata[2] ?? "")" + ", " + "\(storedata[3] ?? "")" + ", " + "\(storedata[4] ?? "")" + ", " + "\(storedata[5] ?? "")"
    }

    @IBAction func finishButton(_ sender: Any) {
        saveName(givenName: "test")
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func historyBtn(_ sender: Any) {
       // saveName(givenName: "test")
        let nextViewController = HistoryViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func saveName(givenName:String) {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext =
          appDelegate.persistentContainer.viewContext

        let entity =
          NSEntityDescription.entity(forEntityName: "Answers",
                                     in: managedContext)!
        
        let answers = NSManagedObject(entity: entity,
                                     insertInto: managedContext)

        answers.setValue(storedata[0], forKeyPath: "answer1")
        answers.setValue(storedata[1], forKeyPath: "answer2")
        answers.setValue(storedata[2], forKeyPath: "answer3")
        answers.setValue(storedata[3], forKeyPath: "answer4")
        answers.setValue(storedata[4], forKeyPath: "answer5")
        answers.setValue(storedata[5], forKeyPath: "answer6")
        answers.setValue(getCurrentShortDate(), forKey: "answer7")

        do {
          try managedContext.save()
         // answers.append(person)
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getCurrentShortDate() -> String {
        let todaysDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
        let DateInFormat = dateFormatter.string(from: todaysDate as Date)

        return DateInFormat
    }
    
}

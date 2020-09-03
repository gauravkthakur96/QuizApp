//
//  HistoryViewController.swift
//  Trivia App
//
//  Created by Gaurav Thakur on 03/09/20.
//  Copyright © 2020 Gaurav Kumar Thakur. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UITableViewController {
    
    var answers: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.title = "History"
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext =
          appDelegate.persistentContainer.viewContext

        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "Answers")

        do {
          answers = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    /// setup table view
    private func setupTableView() {
        tableView.backgroundColor = .white
        tableView.bounces = false
        tableView.rowHeight = 160
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TableViewCell.self)
        tableView.tableFooterView = UIView()
        
    }

}

extension HistoryViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        let textCell = tableView.dequeueReusableCell(TableViewCell.self, for: indexPath)
        let answer = answers[indexPath.row]
        textCell.gameHeading.text = "Game:\(indexPath.row + 1)" + " - " + "\(answer.value(forKey: "answer7") as? String ?? "")"
        textCell.persoName.text = "Hello: " + "\(answer.value(forKey: "answer1") as? String ?? "")"
        textCell.question1.text = "Who is the best cricketer in the world?"
        textCell.answer1.text = "Answer:" + "\(answer.value(forKey: "answer2") as? String ?? "")"
        textCell.question2.text = "What are the colors in the Indian national flag?"
        let flagColor1 = answer.value(forKey: "answer3") as? String ?? ""
        let flagColor2 = answer.value(forKey: "answer4") as? String ?? ""
        let flagColor3 = answer.value(forKey: "answer5") as? String ?? ""
        let flagColor4 = answer.value(forKey: "answer6") as? String ?? ""
        textCell.answer2.text = "Answer:" + "\(flagColor1)" + " ," + "\(flagColor2)" + " ," + "\(flagColor3)" + " ," + "\(flagColor4)"
        
        cell = textCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}


extension UITableView {
    
    public func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    public func register<T: UITableViewCell>(_ cell: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
}

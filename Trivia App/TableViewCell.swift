//
//  TableViewCell.swift
//  Trivia App
//
//  Created by Gaurav Thakur on 03/09/20.
//  Copyright © 2020 Gaurav Kumar Thakur. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

        static let reuseIdentifier = String(describing: TableViewCell.self)
        
        var gameHeading = UILabel()
        var persoName = UILabel()
        var question1 = UILabel()
        var answer1 = UILabel()
        var question2 = UILabel()
        var answer2 = UILabel()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            gameHeading.translatesAutoresizingMaskIntoConstraints = false
            gameHeading.textColor = UIColor.black
            
            persoName.translatesAutoresizingMaskIntoConstraints = false
            persoName.textColor = UIColor.black
            
            question1.translatesAutoresizingMaskIntoConstraints = false
            question1.textColor = UIColor.black
            
            answer1.translatesAutoresizingMaskIntoConstraints = false
            answer1.textColor = UIColor.black
            
            question2.translatesAutoresizingMaskIntoConstraints = false
            question2.textColor = UIColor.black
            
            answer2.translatesAutoresizingMaskIntoConstraints = false
            answer2.textColor = UIColor.black
            
            let labelsView = UIStackView(arrangedSubviews: [gameHeading,persoName,question1,answer1,question2,answer2])
            labelsView.translatesAutoresizingMaskIntoConstraints = false
            labelsView.axis = .vertical
            labelsView.spacing = 2
            
            
            containerView.addSubview(labelsView)
            labelsView.pinSides([.leading, .trailing, .top, .bottom], toView: containerView)
            contentView.addSubview(containerView)
            var guide = contentView.layoutMargins
            guide.left = 10
           // guide.bottom = Constants.kEighteen
            contentView.layoutMargins = guide
            containerView.pinToLayoutGuide(contentView.layoutMarginsGuide)
            
           // tintColor = .PrimaryText
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}


public enum ViewAnchorSide {
    case top
    case leading
    case trailing
    case bottom
}

extension UIView {
    
    @objc public func pinToLayoutGuide(_ guide: UILayoutGuide) {
        let constraints = [
            leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            topAnchor.constraint(equalTo: guide.topAnchor),
            bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    public func pinSides(_ sides: Set<ViewAnchorSide>, toView view: UIView) {
        for value in sides {
            switch value {
            case .top:
                topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            case .leading:
                leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            case .trailing:
                trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            }
        }
    }
}

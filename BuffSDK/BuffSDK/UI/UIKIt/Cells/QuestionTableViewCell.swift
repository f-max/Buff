//
//  QuestionTableViewCell.swift
//  BuffSDK
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var circularTimer: CircularTimer!
    
    var question: Question? {
        didSet {
            if let question = question {
                configure(question: question)
            }
        }
    }
    
    private func configure(question: Question) {
        textLabel?.text = question.title
    }
}

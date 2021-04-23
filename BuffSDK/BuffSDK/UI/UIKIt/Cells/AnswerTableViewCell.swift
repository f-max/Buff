//
//  AnswerTableViewCell.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    var answer: Answer? {
        didSet {
            if let answer = answer {
                configure(answer: answer)
            }
        }
    }
    
    private func configure(answer: Answer) {
        textLabel?.text = answer.title
    }
}

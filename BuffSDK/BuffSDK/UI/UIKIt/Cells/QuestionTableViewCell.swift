//
//  QuestionTableViewCell.swift
//  BuffSDK
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var circularTimer: CircularTimer!
    @IBOutlet weak var textViewQuestion: UITextView!
    
    var question: Question? {
        didSet {
            if let question = question {
                configure(question: question)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 16
    }
    
    private func configure(question: Question) {
        textViewQuestion?.text = question.title
        circularTimer.startTimer(TimeInterval(question.timeToShow))
    }
}     

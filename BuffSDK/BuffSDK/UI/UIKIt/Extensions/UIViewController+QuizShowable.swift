//
//  UIViewController+QuizShowable.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: QuizShowable {
    func show(quiz: Quiz, timeToShow: TimeInterval, completion: @escaping (Bool) -> Void) {
        assertionFailure("to be implemented")
    }
    
    func dismissQuiz(completion: @escaping (Bool) -> Void) {
        assertionFailure("to be implemented")
    }
}

extension UIViewController: Buffable {}

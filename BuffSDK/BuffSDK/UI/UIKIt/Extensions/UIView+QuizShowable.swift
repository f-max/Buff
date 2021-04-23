//
//  Quizzable+UIKit.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation
import UIKit

extension UIView: QuizShowable {
    func show(quiz: Quiz, timeToShow: TimeInterval, completion: @escaping (Bool) -> Void) {
        print("---------- about to show quiz")

        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                completion(false)
                return
            }
            let buffView = BuffView()
            buffView.quiz = quiz
            self.addSubview(buffView)
            buffView.bindFrameToSuperviewBounds()
            completion(true)
        }
    }
    
    func dismissQuiz(completion: @escaping (Bool) -> Void) {
        print("---------- about to dismiss quiz")
        guard let buffView = subviews.first as? BuffView else {
            completion(false)
            return
        }
        buffView.removeFromSuperview()
        completion(true)
    }
}

extension UIView: Buffable {}

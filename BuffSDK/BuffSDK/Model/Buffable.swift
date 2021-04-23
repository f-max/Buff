//
//  BuffStartable.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

protocol Buffable: BuffStartable, BuffStoppable, QuizShowable {}

public protocol BuffStartable: class {
    func startBuffing() -> BuffStartingResult
}

public protocol BuffStoppable: class {
    func stopBuffing()
}

protocol QuizShowable: class {
    func show(quiz: Quiz, timeToShow: TimeInterval, completion: @escaping (Bool) -> Void)
    func dismissQuiz(completion: @escaping (Bool) -> Void)
}

extension BuffStartable {
    public func startBuffing() -> BuffStartingResult {
        return BuffSDK.shared.startBuffing(buffStartable: self)
    }
}

extension BuffStoppable {
    public func stopBuffing() {
        BuffSDK.shared.stopBuffing(buffStoppable: self)
    }
}

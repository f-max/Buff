//
//  BuffStartingResults.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

public enum BuffStartingResults {}
public protocol BuffStartingResult {}

private struct SomeBuffStartingResult: BuffStartingResult {}

public extension BuffStartingResults {
    static let succesfullyStarted: BuffStartingResult = SomeBuffStartingResult()
}

public extension BuffStartingResults {
    static let unableToStart: BuffStartingResult = SomeBuffStartingResult()
}

public extension BuffStartingResults {
    static let alreadyStarted: BuffStartingResult = SomeBuffStartingResult()
}

public extension BuffStartingResults {
    static let unsupportedType: BuffStartingResult = SomeBuffStartingResult()
}

//
//  Buff.swift
//  BuffSDK
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

public final class BuffSDK {
    
    // MARK: - Singleton and initialisation
    
    private init() {}
    static private var initialised = false
    
    public static var shared: BuffSDK {
        guard initialised == true else {
            assertionFailure("BuffSDK needs to be initialised before use")
            return shared_
        }
        return shared_
    }
    private static let shared_ = BuffSDK()
    
    public static func initialise() {
        defer {
            initialised = true
        }
        guard initialised == false else {
            assertionFailure("trying to initialise BuffSDK twice")
            return
        }
    }
    
    // MARK: - Non-public memebers
    
    var fetcher: RealQuizFetcher = RealQuizFetcher()
    var timer: Timer?
    weak var buffable: Buffable?
    
    func startBuffing(buffStartable: BuffStartable) -> BuffStartingResult {
        guard let providedBuffable = buffStartable as? Buffable else {
            return BuffStartingResults.unsupportedType
        }
        guard isBuffing == false else {
            return BuffStartingResults.alreadyStarted
        }
        
        self.buffable = providedBuffable
        self.buffNow(quizId: 1)

        return BuffStartingResults.succesfullyStarted
    }
    
    func stopBuffing(buffStoppable: BuffStoppable) {
        if isShowingQuiz == true {
            buffable?.dismissQuiz { _ in }
        }
        self.timer?.invalidate()
        self.buffable = nil
    }
    
    private func buffNow(quizId: Int) {
        print("---------- Buffing now")
        fetcher.fetch(quizId: quizId) { result in
            guard let buffable = self.buffable, self.isShowingQuiz == false else {
                return
            }
            print("---------- Fetched quiz n. \(quizId)")
            DispatchQueue.main.async {
                if quizId < ModelConstants.maxQuizId {
                    let timer = Timer(timeInterval: ModelConstants.timeoutInterval,
                                      repeats: false,
                                      block: { _ in
                                        self.buffNow(quizId: quizId + 1)
                                      })
                    self.timer = timer
                    RunLoop.current.add(timer, forMode: .common)
                } else {
                    self.timer = nil
                }
            }
            var quiz: Quiz
            switch result {
            case .failure:
                return
            case .success(let fetchedQuiz):
                quiz = Quiz(result: fetchedQuiz.result)
                quiz.author.loadImage {
                    buffable.show(quiz: quiz,
                                  timeToShow: TimeInterval(quiz.timeToShow)) { success in
                        self.isShowingQuiz = success
                        if success == true {
                            print("---------- showing quiz")
                            self.delegate?.didShowQuiz()
                        }
                    }
                }
            }
            
        }
    }
    
    func buffViewDidCompleteTask(buffView: BuffView) {
        buffable?.dismissQuiz { result in
            if result == true {
                self.delegate?.didDismissQuiz()
                self.isShowingQuiz = false
                print("---------- did dismiss quiz")
            }
        }
    }
    
    // MARK: - Public memebers
    
    public var isBuffing: Bool {
        timer?.isValid == true
    }
    public private(set) var isShowingQuiz = false
    public weak var delegate: BuffDelegate?
}

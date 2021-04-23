//
//  BuffView.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import UIKit

class BuffView: UIViewNibLoadable {
    
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func didClose(_ sender: Any) {
        markTaskComplete()
    }
    
    enum CellReuseIdentifiers {
        static let AnswerTableViewCell = "AnswerTableViewCell"
        static let AuthorTableViewCell = "AuthorTableViewCell"
        static let QuestionTableViewCell = "QuestionTableViewCell"
    }
    
    var quiz: Quiz? {
        didSet {
            guard let newvalue = quiz else {
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(newvalue.timeToShow)) { [weak self] in
                self?.markTaskComplete()
            }
        }
    }
        
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // we don't want any events to be propagated to superviews... do we?
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func initFromNib() {
        super.initFromNib()
        
        let thisBundle = Bundle(for: BuffView.self)
        tableView.register(UINib(nibName: CellReuseIdentifiers.AnswerTableViewCell, bundle: thisBundle), forCellReuseIdentifier: CellReuseIdentifiers.AnswerTableViewCell)
        tableView.register(UINib(nibName: CellReuseIdentifiers.AuthorTableViewCell, bundle: thisBundle), forCellReuseIdentifier: CellReuseIdentifiers.AuthorTableViewCell)
        tableView.register(UINib(nibName: CellReuseIdentifiers.QuestionTableViewCell, bundle: thisBundle), forCellReuseIdentifier: CellReuseIdentifiers.QuestionTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func markTaskComplete() {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        BuffSDK.shared.buffViewDidCompleteTask(buffView: self) // possibly implement it by means of a delegate
    }
}

extension BuffView: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return quiz?.author != nil ? 1 : 0
        case 1:
            return quiz?.question != nil ? 1 :0
        case 2:
            return quiz?.answers.count ?? 0
        default:
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.AuthorTableViewCell) as? AuthorTableViewCell {
                cell.author = quiz?.author
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.QuestionTableViewCell) as? QuestionTableViewCell {
                cell.question = quiz?.question
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.AnswerTableViewCell) as? AnswerTableViewCell {
                cell.answer = quiz?.answers[indexPath.row]
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }
}

extension BuffView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            markTaskComplete()
        }
    }
}

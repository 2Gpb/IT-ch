//
//  ITCHHelpQuestionCell.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHHelpQuestionCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
            static let backgroundColor: UIColor = .clear
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHHelpQuestionCell"
        }
        
        enum HelpQuestion {
            static let offsets: CGFloat = 16
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let helpQuestionView: ITCHHelpQuestionsView = ITCHHelpQuestionsView()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    func configure(with model: ITCHHelpQuestionViewModel) {
        helpQuestionView.configure(with: model)
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = Constant.View.selectionStyle
        backgroundColor = Constant.View.backgroundColor
        
        addSubview(helpQuestionView)
        helpQuestionView.pinHorizontal(to: self, Constant.HelpQuestion.offsets)
        helpQuestionView.pinVertical(to: self, Constant.HelpQuestion.offsets)
    }
}

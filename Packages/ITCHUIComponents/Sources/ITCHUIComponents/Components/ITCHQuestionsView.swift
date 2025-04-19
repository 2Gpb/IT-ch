//
//  ITCHQuestionsView.swift
//  ITCHUIComponents
//
//  Created by Peter on 19.04.2025.
//

import UIKit

public final class ITCHQuestionsView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum Question {
            static let font: UIFont = ITCHFont.header5SemiBold.font
            static let textColor: UIColor = ITCHColor.blue60.color
            static let numberOfLines: Int = 0
        }
        
        enum Answer {
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let numberOfLines: Int = 0
            static let bottomOffset: CGFloat = 16
        }
    }
    
    // MARK: - UI Components
    private let questionLabel: UILabel = UILabel()
    private let answerLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    public init() {
        super.init(frame: .zero)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    public func configure(question: String, answer: String) {
        self.questionLabel.text = question
        self.answerLabel.text = answer
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpQuestionLabel()
        setUpAnswerLabel()
    }
    
    private func setUpQuestionLabel() {
        questionLabel.font = Constant.Question.font
        questionLabel.textColor = Constant.Question.textColor
        questionLabel.numberOfLines = Constant.Question.numberOfLines
        
        addSubview(questionLabel)
        questionLabel.pinTop(to: self)
        questionLabel.pinHorizontal(to: self)
    }
    
    private func setUpAnswerLabel() {
        answerLabel.font = Constant.Answer.font
        answerLabel.textColor = Constant.Answer.textColor
        answerLabel.numberOfLines = Constant.Answer.numberOfLines
        
        addSubview(answerLabel)
        answerLabel.pinTop(to: questionLabel.bottomAnchor, Constant.Answer.bottomOffset)
        answerLabel.pinHorizontal(to: self)
        answerLabel.pinBottom(to: self)
    }
}

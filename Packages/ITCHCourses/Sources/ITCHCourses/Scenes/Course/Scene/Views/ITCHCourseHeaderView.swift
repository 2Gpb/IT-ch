//
//  ITCHCourseHeaderView.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCourseHeaderView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
        }

        enum Label {
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let textColor: UIColor = ITCHColor.base50.color
            static let horizontalOffset: CGFloat = 16
        }
    }

    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private let separatorView: UIView = UIView()

    // MARK: - Lifecycle
    init(with title: String? = nil) {
        super.init(frame: .zero)
        setUp(title: title)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }

    // MARK: - SetUp
    private func setUp(title: String?) {
        backgroundColor = Constant.View.backgroundColor
        if let title {
            setUpTitleLabel(with: title)
        } else {
            setUpSeparator()
        }
    }
    
    private func setUpTitleLabel(with text: String) {
        titleLabel.text = text
        titleLabel.textColor = Constant.Label.textColor
        titleLabel.font = Constant.Label.font
        
        addSubview(titleLabel)
        titleLabel.pinHorizontal(to: self, Constant.Label.horizontalOffset)
        titleLabel.pinVertical(to: self)
    }
    
    private func setUpSeparator() {
        separatorView.backgroundColor = ITCHColor.base70.color
        
        addSubview(separatorView)
        separatorView.setHeight(1)
        separatorView.pinTop(to: self, -8)
        separatorView.pinBottom(to: self, 8)
        separatorView.pinHorizontal(to: self, 16)
    }
}

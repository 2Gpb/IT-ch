//
//  ITCHIconHeaderView.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHIconHeaderView: UICollectionReusableView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value = "ITCHIconHeaderView"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
        }

        enum Label {
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let textColor: UIColor = ITCHColor.base50.color
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value

    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        setUpTitleLabel()
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Label.textColor
        titleLabel.font = Constant.Label.font
        
        addSubview(titleLabel)
        titleLabel.pinHorizontal(to: self)
        titleLabel.pinTop(to: self)
    }
}

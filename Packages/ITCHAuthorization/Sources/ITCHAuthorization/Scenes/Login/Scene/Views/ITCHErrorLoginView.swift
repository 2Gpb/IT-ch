//
//  ITCHErrorLoginView.swift
//  ITCHAuthorization
//
//  Created by Peter on 21.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHErrorLoginView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.tabBar.color
            static let cornerRadius: CGFloat = 12
            static let height: CGFloat = 56
        }
        
        enum Image {
            static let image: UIImage = ITCHImage.error24.image
            static let leadingOffset: CGFloat = 16
        }
        
        enum Label {
            static let text: String = "Неверный логин или пароль"
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let leadingOffset: CGFloat = 12
        }
    }
    
    // MARK: - UI Components
    private let errorImageView: UIImageView = UIImageView()
    private let errorLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpErrorImageView()
        setUpErrorLabel()
    }
    
    private func setUpView() {
        backgroundColor = Constant.View.backgroundColor
        layer.cornerRadius = Constant.View.cornerRadius
        setHeight(Constant.View.height)
    }
    
    private func setUpErrorImageView() {
        errorImageView.image = Constant.Image.image
        
        addSubview(errorImageView)
        errorImageView.pinLeft(to: self, Constant.Image.leadingOffset)
        errorImageView.pinCenterY(to: self)
    }
    
    private func setUpErrorLabel() {
        errorLabel.text = Constant.Label.text
        errorLabel.textColor = Constant.Label.textColor
        errorLabel.font = Constant.Label.font
        
        addSubview(errorLabel)
        errorLabel.pinLeft(to: errorImageView.trailingAnchor, Constant.Label.leadingOffset)
        errorLabel.pinCenterY(to: self)
    }
}

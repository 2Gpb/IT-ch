//
//  ITCHErrorLoginView.swift
//  ITCHAuthorization
//
//  Created by Peter on 21.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHErrorLoginView: UIView {
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
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpErrorImageView()
        setUpErrorLabel()
    }
    
    private func setUpView() {
        backgroundColor = ITCHColor.tabBar.color
        layer.cornerRadius = 12
        setHeight(56)
    }
    
    private func setUpErrorImageView() {
        errorImageView.image = ITCHImage.error24.image
        
        addSubview(errorImageView)
        errorImageView.pinLeft(to: self, 16)
        errorImageView.pinCenterY(to: self)
    }
    
    private func setUpErrorLabel() {
        errorLabel.text = "Неверный логин или пароль"
        errorLabel.textColor = ITCHColor.base0.color
        errorLabel.font = ITCHFont.bodyMMedium.font
        
        addSubview(errorLabel)
        errorLabel.pinLeft(to: errorImageView.trailingAnchor, 12)
        errorLabel.pinCenterY(to: self)
    }
}

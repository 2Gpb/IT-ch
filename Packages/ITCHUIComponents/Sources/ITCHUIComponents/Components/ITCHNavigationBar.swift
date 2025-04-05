//
//  PrimaryNavigationBar.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 13.03.2025.
//

import UIKit

final class ITCHNavigationBar: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let height: CGFloat = 56
        }
        
        enum Buttons {
            static let dimension: CGFloat = 50
            static let imageConfiguraton: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(
                pointSize: 24,
                weight: .medium
            )
        }
    }
    
    // MARK: - UI Components
    private let leftButton: UIButton = UIButton(type: .system)
    private let title: UILabel = UILabel()
    private let rightButton: UIButton = UIButton(type: .system)
    
    // MARK: - lifecycle
    init(title: String, leftImage: UIImage? = nil, rightImage: UIImage? = nil) {
        super.init(frame: .zero)
        
        self.title.text = title
        leftButton.setImage(leftImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        rightButton.setImage(rightImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        setHeight(Constant.View.height)
        
        setUpTitle()
        setUpLeftView()
        setUpRightView()
    }
    
    private func setUpTitle() {
        title.textColor = ITCHColor.base0.color
        title.font = ITCHFont.header5Medium.font
        title.textAlignment = .center
        
        addSubview(title)
        title.pinCenter(to: self)
    }
    
    private func setUpLeftView() {
        guard leftButton.currentImage != nil else { return }
        leftButton.setPreferredSymbolConfiguration(Constant.Buttons.imageConfiguraton, forImageIn: .normal)
        leftButton.backgroundColor = .clear
        leftButton.tintColor = ITCHColor.blue60.color
        
        addSubview(leftButton)
        leftButton.pinLeft(to: self)
        leftButton.pinCenterY(to: self)
        leftButton.setHeight(Constant.Buttons.dimension)
        leftButton.setWidth(Constant.Buttons.dimension)
    }
    
    private func setUpRightView() {
        guard rightButton.currentImage != nil else { return }
        rightButton.backgroundColor = .clear
        rightButton.setPreferredSymbolConfiguration(Constant.Buttons.imageConfiguraton, forImageIn: .normal)
        rightButton.tintColor = ITCHColor.blue60.color
        
        addSubview(rightButton)
        rightButton.pinRight(to: self)
        rightButton.pinCenterY(to: self)
        rightButton.setHeight(Constant.Buttons.dimension)
        rightButton.setWidth(Constant.Buttons.dimension)
    }
}

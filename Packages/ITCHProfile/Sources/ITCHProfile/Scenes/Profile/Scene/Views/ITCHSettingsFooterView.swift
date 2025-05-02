//
//  ITCHSettingsFooterView.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSettingsFooterView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
        }
        
        enum Footer {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            static let height: CGFloat = 22
        }
    }

    // MARK: - UI Components
    private let footer: UIView = UIView()

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
        backgroundColor = Constant.View.backgroundColor
        setUpFooter()
    }
    
    private func setUpFooter() {
        footer.backgroundColor = Constant.Footer.backgroundColor
        footer.layer.cornerRadius = Constant.Footer.cornerRadius
        footer.layer.maskedCorners = Constant.Footer.maskedCorners
        
        addSubview(footer)
        footer.setHeight(Constant.Footer.height)
        footer.pinHorizontal(to: self)
        footer.pinBottom(to: self)
    }
}

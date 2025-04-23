//
//  ITCHScheduleHeaderView.swift
//  ITCHSchedule
//
//  Created by Peter on 22.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHScheduleHeaderView: UICollectionReusableView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }

        enum ReuseIdentifier {
            static let value = "ITCHScheduleHeaderView"
        }

        enum View {
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 8
            static let bottomOffset: CGFloat = 4
        }

        enum Label {
            static let font: UIFont = ITCHFont.bodySMedium.font
            static let textColor: UIColor = ITCHColor.base30.color
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 16
            static let format: String = "EEEE, d MMMM"
        }
        
        enum WrapView {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let horizontalOffset: CGFloat = 16
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            static let clipsToBounds: Bool = true
        }
    }

    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value

    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private let wrapView: UIView = UIView()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }

    // MARK: - Configure
    func configure(with date: Date) {
        let formatted = date.configure(to: Constant.Label.format)
        titleLabel.text = formatted.prefix(1).uppercased() + formatted.dropFirst()
    }

    // MARK: - SetUp
    private func setUp() {
        setUpWrapView()
        setUpTitleLabel()
    }
    
    private func setUpWrapView() {
        wrapView.backgroundColor = Constant.WrapView.backgroundColor
        wrapView.layer.cornerRadius = Constant.WrapView.cornerRadius
        wrapView.layer.maskedCorners = Constant.WrapView.maskedCorners
        wrapView.clipsToBounds = Constant.WrapView.clipsToBounds
        
        addSubview(wrapView)
        wrapView.pinHorizontal(to: self, Constant.WrapView.horizontalOffset)
        wrapView.pinVertical(to: self)
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Label.textColor
        titleLabel.font = Constant.Label.font
        
        wrapView.addSubview(titleLabel)
        titleLabel.pinHorizontal(to: wrapView, Constant.Label.horizontalOffset)
        titleLabel.pinTop(to: wrapView, Constant.Label.topOffset)
        titleLabel.pinBottom(to: wrapView)
    }
}

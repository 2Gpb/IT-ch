//
//  PrimaryNavigationRow.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 13.03.2025.
//

import UIKit

final class PrimaryNavigationRow: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let height: CGFloat = 40
        }
        
        enum LeftView {
            static let dimension: CGFloat = 28
        }
        
        enum Label {
            static let leftOffset: CGFloat = 12
        }
        
        enum Chevron {
            static let image: UIImage? = UIImage(named: "ArrowRight")?.withRenderingMode(.alwaysTemplate)
            static let dimension: CGFloat = 18
        }
    }
    
    // MARK: - UI Components
    private let leftView: UIImageView = UIImageView()
    private let label: UILabel = UILabel()
    private let chevron: UIImageView = UIImageView()
    
    // MARK: - Variables
    var title: String? {
        didSet {
            label.text = title
        }
    }
    
    // MARK: - Lifecycle
    init(title: String = "test", leftImage: UIImage? = nil) {
        super.init(frame: .zero)
        
        label.text = title
        leftView.image = leftImage?.withRenderingMode(.alwaysTemplate)
        
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        setHeight(Constant.View.height)
        
        setUpLeftView()
        setUpLabel()
        setUpChevron()
    }
    
    private func setUpLeftView() {
        guard leftView.image != nil else { return }
        leftView.tintColor = UIColor(color: .base50)
        
        
        addSubview(leftView)
        leftView.pinLeft(to: self)
        leftView.pinCenterY(to: self)
        leftView.setHeight(Constant.LeftView.dimension)
        leftView.setWidth(Constant.LeftView.dimension)
    }
    
    private func setUpLabel() {
        label.font = ITCHFont.bodyMMedium.font
        label.textColor = UIColor(color: .base0)
        
        addSubview(label)
        label.pinCenterY(to: self)
        if leftView.image == nil {
            label.pinLeft(to: self)
        } else {
            label.pinLeft(to: leftView.trailingAnchor, Constant.Label.leftOffset)
        }
    }
    
    private func setUpChevron() {
        chevron.image = Constant.Chevron.image
        chevron.tintColor = UIColor(color: .base50)
        
        addSubview(chevron)
        chevron.pinRight(to: self)
        chevron.pinCenterY(to: self)
        chevron.setHeight(Constant.Chevron.dimension)
        chevron.setWidth(Constant.Chevron.dimension)
    }
}

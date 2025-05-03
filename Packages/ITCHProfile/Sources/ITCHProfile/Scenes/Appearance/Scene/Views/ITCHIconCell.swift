//
//  ITCHIconCell.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHIconCell: UICollectionViewCell {
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHIconCell"
        }
        
        enum WrapView {
            static let borderWidth: CGFloat = 1.6
            static let borderColor: UIColor = ITCHColor.blue60.color
            static let cornerRadius: CGFloat = 20
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - Properties
    var wasSelected: Bool = false {
        didSet {
            wrapView.isHidden = !wasSelected
        }
    }
    
    // MARK: - UI Components
    private let wrapView: UIView = UIView()
    private let iconImageView: UIImageView = UIImageView()
    
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
    func configure(with image: UIImage, isSelected: Bool) {
        iconImageView.image = image
        wrapView.isHidden = !isSelected
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpWrapView()
        setUpIconImageView()
    }
    
    private func setUpWrapView() {
        wrapView.layer.borderWidth = Constant.WrapView.borderWidth
        wrapView.layer.borderColor = Constant.WrapView.borderColor.cgColor
        wrapView.layer.cornerRadius = Constant.WrapView.cornerRadius
        
        contentView.addSubview(wrapView)
        wrapView.pin(to: contentView)
    }
    
    private func setUpIconImageView() {
        contentView.addSubview(iconImageView)
        iconImageView.pinCenter(to: contentView)
    }
}

//
//  ITCHScheduleCell.swift
//  ITCHSchedule
//
//  Created by Peter on 22.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHScheduleCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHScheduleCell"
        }
        
        enum Schedule {
            static let horizontalOffset: CGFloat = 16
            static let verticalOffset: CGFloat = 20
        }
        
        enum Separator {
            static let backgroundColor: UIColor = ITCHColor.base70.color
            static let horizontalOffset: CGFloat = 16
            static let separatorHeight: CGFloat = 1
        }
        
        enum WrapView {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let horizontalOffset: CGFloat = 16
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            static let clipsToBounds: Bool = true
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let wrapView: UIView = UIView()
    private let scheduleView: ITCHScheduleView = ITCHScheduleView()
    private let separatorView: UIView = UIView()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        wrapView.layer.cornerRadius = 0
    }
    
    // MARK: - Methods
    func configure(with viewModel: ITCHScheduleViewModel, isLastCell: Bool) {
        scheduleView.configure(with: viewModel)
        separatorView.isHidden = isLastCell
        
        guard isLastCell else { return }
        wrapView.layer.cornerRadius = Constant.WrapView.cornerRadius
        wrapView.layer.maskedCorners = Constant.WrapView.maskedCorners
        wrapView.clipsToBounds = Constant.WrapView.clipsToBounds
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = .none
        backgroundColor = .clear
        
        setUpWrapView()
        setUpScheduleView()
        setUpSeparatorView()
    }
    
    private func setUpWrapView() {
        wrapView.backgroundColor = Constant.WrapView.backgroundColor

        contentView.addSubview(wrapView)
        wrapView.pinHorizontal(to: contentView, Constant.WrapView.horizontalOffset)
        wrapView.pinVertical(to: contentView)
    }
    
    private func setUpScheduleView() {
        wrapView.addSubview(scheduleView)
        scheduleView.pinVertical(to: wrapView, Constant.Schedule.verticalOffset)
        scheduleView.pinHorizontal(to: wrapView, Constant.Schedule.horizontalOffset)
    }
    
    private func setUpSeparatorView() {
        separatorView.backgroundColor = Constant.Separator.backgroundColor
        
        wrapView.addSubview(separatorView)
        separatorView.pinBottom(to: wrapView)
        separatorView.pinHorizontal(to: wrapView, Constant.Separator.horizontalOffset)
        separatorView.setHeight(Constant.Separator.separatorHeight)
    }
}

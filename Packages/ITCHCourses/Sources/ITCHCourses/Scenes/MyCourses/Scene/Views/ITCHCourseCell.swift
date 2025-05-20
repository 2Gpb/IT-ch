//
//  ITCHCourseCell.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCourseCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHCourseCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum Course {
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let courseView: ITCHCourseView = ITCHCourseView()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    func configure(with viewModel: ITCHCourseViewModel) {
        courseView.configure(with: viewModel)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setUpCourseView()
    }
    
    private func setUpCourseView() {
        contentView.addSubview(courseView)
        courseView.pinTop(to: contentView, Constant.Course.topOffset)
        courseView.pinHorizontal(to: contentView, Constant.Course.horizontalOffset)
        courseView.pinBottom(to: contentView)
    }
}

//
//  ITCHDatePicker.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

public final class ITCHDatePicker: UIView {
    // MARK: - Constants
    private enum Constants {
        enum Error {
            static let fatalError: String = "init(coder:) has not been implemented"
        }
        
        enum Buttons {
            static let type: UIButton.ButtonType = .system
            static let backgroundColor: UIColor = .clear
            static let cancelTitle: String = "Отмена"
            static let doneTitle: String = "Готово"
            static let stateTitle: UIControl.State = .normal
            static let font: UIFont = ITCHFont.navBarMedium.font
            static let titleColor: UIColor = ITCHColor.blue70.color
            static let stateTitleColor: UIControl.State = .normal
            static let event: UIControl.Event = .touchUpInside
            static let top: CGFloat = 12
            static let height: CGFloat = 28
            static let width: CGFloat = 68
            static let cancelLeft: CGFloat = 12
            static let doneRight: CGFloat = 12
        }
        
        enum DatePicker {
            static let style: UIDatePickerStyle = .inline
            static let locale: Locale = Locale(identifier: "ru_RU")
            static let themeStyle: UIUserInterfaceStyle = .dark
            static let backgroundColor: UIColor = ITCHColor.backgroundDark.color
            static let horizontalOffset: CGFloat = 8
        }
    }
    
    // MARK: - Variables
    public var cancelAction: (() -> Void)?
    public var doneAction: (() -> Void)?
    public var date: Date? {
        datePicker.date
    }
    
    // MARK: - Private fields
    private let cancelButton: UIButton = UIButton(type: Constants.Buttons.type)
    private let doneButton: UIButton = UIButton(type: Constants.Buttons.type)
    private let datePicker: UIDatePicker = UIDatePicker()
    
    // MARK: - Lifecycle
    public init(mode: UIDatePicker.Mode) {
        super.init(frame: .zero)
        setUp(with: mode)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.Error.fatalError)
    }
    
    // MARK: - Methods
    public func configure(with date: Date) {
        datePicker.date = date
    }
    
    // MARK: - SetUp
    private func setUp(with mode: UIDatePicker.Mode) {
        backgroundColor = ITCHColor.backgroundDark.color
        
        setUpButtons()
        setUpDoneButton()
        setUpCancelButton()
        setUpDatePicker(with: mode)
    }
    
    private func setUpButtons() {
        for button in [cancelButton, doneButton] {
            button.backgroundColor = Constants.Buttons.backgroundColor
            button.titleLabel?.font = Constants.Buttons.font
            button.setTitleColor(Constants.Buttons.titleColor, for: Constants.Buttons.stateTitleColor)
        }
    }
    
    private func setUpDoneButton() {
        doneButton.setTitle(Constants.Buttons.doneTitle, for: Constants.Buttons.stateTitle)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: Constants.Buttons.event)
        
        addSubview(doneButton)
        doneButton.pinTop(to: self, Constants.Buttons.top)
        doneButton.pinRight(to: self, Constants.Buttons.doneRight)
        doneButton.setHeight(Constants.Buttons.height)
        doneButton.setWidth(Constants.Buttons.width)
    }
    
    private func setUpCancelButton() {
        cancelButton.setTitle(Constants.Buttons.cancelTitle, for: Constants.Buttons.stateTitle)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: Constants.Buttons.event)
        
        addSubview(cancelButton)
        cancelButton.pinTop(to: self, Constants.Buttons.top)
        cancelButton.pinLeft(to: self, Constants.Buttons.cancelLeft)
        cancelButton.setHeight(Constants.Buttons.height)
        cancelButton.setWidth(Constants.Buttons.width)
    }
    
    private func setUpDatePicker(with mode: UIDatePicker.Mode) {
        datePicker.datePickerMode = mode
        datePicker.preferredDatePickerStyle = Constants.DatePicker.style
        datePicker.locale = Constants.DatePicker.locale
        datePicker.overrideUserInterfaceStyle = Constants.DatePicker.themeStyle
        datePicker.backgroundColor = Constants.DatePicker.backgroundColor

        addSubview(datePicker)
        datePicker.pinHorizontal(to: self, Constants.DatePicker.horizontalOffset)
        datePicker.pinTop(to: cancelButton.bottomAnchor)
        datePicker.pinBottom(to: self)
    }
    
    // MARK: - Actions
    @objc
    private func cancelButtonTapped() {
        cancelAction?()
    }
    
    @objc
    private func doneButtonTapped() {
        doneAction?()
    }
}

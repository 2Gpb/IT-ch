//
//  ITCHScheduleEditor.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHScheduleEditorViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let createTitle: String = "Добавить расписание"
            static let changeTitle: String = "Изменить расписание"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum SaveButton {
            static let createTitle: String = "Создать курс"
            static let saveTitle: String = "Сохранить"
            static let bottomOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum ScrollView {
            static let bottomOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum TimeStack {
            static let spacing: CGFloat = 20
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let distribution: UIStackView.Distribution = .fillEqually
            static let horizontalOffsets: CGFloat = 32
        }
        
        enum ContentStack {
            static let spacing: CGFloat = 20
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let topOffset: CGFloat = 20
        }
        
        enum Pickers {
            static let numberOfComponents: Int = 1
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHScheduleEditorBusinessLogic
    private var pickerConfigs: [ITCHPickerAlertModel] = []
    private var selectedDay: String = ""
    private var selectedTime: String = ""
    private var selectedFrequency: String = ""
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let dayTextField: ITCHTextField = ITCHTextField()
    private let dayAlert = ITCHPickerAlertView()
    
    private let numberOfHoursTextField: ITCHTextField = ITCHTextField()
    
    private let startTimeTextField: ITCHTextField = ITCHTextField()
    private let timeAlert = ITCHPickerAlertView()
    private let timeStackView: UIStackView = UIStackView()
    
    private let frequencyTextField: ITCHTextField = ITCHTextField()
    private let frequencyAlert = ITCHPickerAlertView()
    
    private let contentStackView: UIStackView = UIStackView()
    private let contentScrollView: UIScrollView = UIScrollView()
    
    private let saveButton: ITCHButton = ITCHButton()
    
    // MARK: - Lifecycle
    init(interactor: ITCHScheduleEditorBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        interactor.loadStart()
    }
    
    // MARK: - Methods
    func displayStart(with mode: ITCHEditingMode) {
        let title: String
        switch mode {
        case .create:
            title = Constant.NavigationBar.createTitle
            saveButton.configure(title: Constant.SaveButton.createTitle)
            saveButton.action = { [weak self] in
                self?.interactor.loadCourses()
            }
        case .edit:
            title = Constant.NavigationBar.changeTitle
            saveButton.configure(title: Constant.SaveButton.saveTitle)
            saveButton.action = { [weak self] in
                self?.interactor.loadDismiss()
            }
        }
        
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: title,
                leftImage: Constant.NavigationBar.leftImage
            )
        )
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
        setUpSaveButton()
        setUpContentScrollView()
        setUpPickers()
        setUpTextFields()
        setUpTimeStackView()
        setUpContentStackView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpSaveButton() {
        view.addSubview(saveButton)
        saveButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constant.SaveButton.bottomOffset)
        saveButton.pinHorizontal(to: view, Constant.SaveButton.horizontalOffset)
    }
    
    private func setUpContentScrollView() {
        view.addSubview(contentScrollView)
        contentScrollView.pinTop(to: navigationBar.bottomAnchor)
        contentScrollView.pinHorizontal(to: view, Constant.ScrollView.horizontalOffset)
        contentScrollView.pinBottom(to: saveButton.topAnchor, Constant.ScrollView.bottomOffset)
    }
    
    private func setUpTextFields() {
        dayTextField.configure(with: ITCHScheduleEditorTextFieldConfig.day())
        dayTextField.beforeOpenKeyboardAction = { [weak self] in
            guard let self else { return }
            self.dayAlert.present(on: self)
        }
        
        numberOfHoursTextField.configure(with: ITCHScheduleEditorTextFieldConfig.numberOfHours())
        
        startTimeTextField.configure(with: ITCHScheduleEditorTextFieldConfig.startTime())
        startTimeTextField.beforeOpenKeyboardAction = { [weak self] in
            guard let self else { return }
            self.timeAlert.present(on: self)
        }
        
        frequencyTextField.configure(with: ITCHScheduleEditorTextFieldConfig.frequency())
        frequencyTextField.beforeOpenKeyboardAction = { [weak self] in
            guard let self else { return }
            self.frequencyAlert.present(on: self)
        }
    }
    
    private func setUpTimeStackView() {
        timeStackView.axis = Constant.TimeStack.axis
        timeStackView.spacing = Constant.TimeStack.spacing
        timeStackView.distribution = Constant.TimeStack.distribution
        timeStackView.setWidth(view.frame.width - Constant.TimeStack.horizontalOffsets)
        [numberOfHoursTextField, startTimeTextField].forEach { element in
            timeStackView.addArrangedSubview(element)
        }
    }
    
    private func setUpContentStackView() {
        contentStackView.axis = Constant.ContentStack.axis
        contentStackView.spacing = Constant.ContentStack.spacing
        [dayTextField, timeStackView, frequencyTextField].forEach { element in
            contentStackView.addArrangedSubview(element)
        }
        
        contentScrollView.addSubview(contentStackView)
        contentStackView.pinTop(to: contentScrollView, Constant.ContentStack.topOffset)
        contentStackView.pinHorizontal(to: contentScrollView)
    }
    
    private func setUpPickers() {
        pickerConfigs = [
            ITCHPickerAlertConfig.day(
                alert: dayAlert,
                delegate: self,
                dataSource: self,
                confirmAction: { [weak self] in
                    self?.dayTextField.text = self?.selectedDay
                }
            ),
            ITCHPickerAlertConfig.time(
                alert: timeAlert,
                delegate: self,
                dataSource: self,
                confirmAction: { [weak self] in
                    self?.startTimeTextField.text = self?.selectedTime
                }
            ),
            ITCHPickerAlertConfig.frequency(
                alert: frequencyAlert,
                delegate: self,
                dataSource: self,
                confirmAction: { [weak self] in
                    self?.frequencyTextField.text = self?.selectedFrequency
                }
            )
        ]

        pickerConfigs.forEach { config in
            config.alert.configure(with: config.viewModel)
        }
    }
}

// MARK: - UIPickerViewDelegate
extension ITCHScheduleEditorViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let index = pickerConfigs.firstIndex(where: { config in
            config.viewModel.tag == pickerView.tag
        }) {
            switch pickerView.tag {
            case 0:
                selectedDay = pickerConfigs[index].items[row]
            case 1:
                selectedTime = pickerConfigs[index].items[row]
            case 2:
                selectedFrequency = pickerConfigs[index].items[row]
            default:
                break
            }
        }
    }
}

// MARK: - UIPickerViewDataSource
extension ITCHScheduleEditorViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        Constant.Pickers.numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerConfigs.first(where: { $0.viewModel.tag == pickerView.tag })?.items.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerConfigs.first(where: { $0.viewModel.tag == pickerView.tag })?.items[row]
    }
}

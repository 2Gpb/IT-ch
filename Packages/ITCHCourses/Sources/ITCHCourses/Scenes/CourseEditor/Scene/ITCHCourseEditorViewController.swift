//
//  ITCHCourseEditorViewController.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUIComponents
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager

final class ITCHCourseEditorViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        }
        
        enum NavigationBar {
            static let createTitle: String = "Создать курс"
            static let changeTitle: String = "Изменить курс"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum ContinueButton {
            static let continueTitle: String = "Далее"
            static let saveTitle: String = "Сохранить"
            static let bottomOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum ContentScrollView {
            static let bottomOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum DurationPicker {
            static let alertTitle: String = "Модули начала и конца курса"
            static let alertMessage: String = "\n\n\n\n\n\n\n\n\n\n"
            static let style: UIAlertController.Style = .actionSheet
            static let x: CGFloat = 0
            static let y: CGFloat = 0
            static let height: CGFloat = 220
            static let horizontalPadding: CGFloat = 40
            static let topOffset: CGFloat = 28
            static let confirmButtonTitle: String = "Готово"
            static let cancelButtonTitle: String = "Отмена"
            static let numberOfColumns: Int = 2
            static let textSuffix: String = " Модуль"
        }
        
        enum LocationDurationStack {
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let spacing: CGFloat = 20
            static let distribution: UIStackView.Distribution = .fillEqually
            static let horizontalPadding: CGFloat = 32
        }
        
        enum ContentStack {
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 20
            static let topOffset: CGFloat = 20
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHCourseEditorBusinessLogic
    private let modules: [Int] = [1, 2, 3, 4]
    private var selectedStart: Int = 1
    private var selectedEnd: Int = 1
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let nameTextField: ITCHTextField = ITCHTextField()
    private let locationTextField: ITCHTextField = ITCHTextField()
    private let durationTextField: ITCHTextField = ITCHTextField()
    private let durationPickerView: UIPickerView = UIPickerView()
    private let durationAlertController: UIAlertController = UIAlertController(
        title: Constant.DurationPicker.alertTitle,
        message: Constant.DurationPicker.alertMessage,
        preferredStyle: Constant.DurationPicker.style
    )
    private let locationDurationStackView: UIStackView = UIStackView()
    private let chatLinkTextField: ITCHTextField = ITCHTextField()
    private let gradesLinkTextField: ITCHTextField = ITCHTextField()
    private let contentStackView: UIStackView = UIStackView()
    private let contentScrollView: UIScrollView = UIScrollView()
    private let continueButton: ITCHButton = ITCHButton()
    
    // MARK: - Lifecycle
    init(interactor: ITCHCourseEditorBusinessLogic) {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.keyboardState = .open
    }
    
    // MARK: - Methods
    func displayStart(with model: ITCHCourseEditorModel?) {
        let title: String
        
        let courseModel = { [weak self] in
            return ITCHCourseEditorModel(
                name: self?.nameTextField.text ?? "",
                location: self?.locationTextField.text ?? "",
                duration: self?.durationTextField.text ?? "",
                chatLink: self?.chatLinkTextField.text ?? "",
                gradesLink: self?.gradesLinkTextField.text ?? ""
            )
        }
        
        if let model {
            title = Constant.NavigationBar.changeTitle
            continueButton.configure(title: Constant.ContinueButton.saveTitle)
            continueButton.action = { [weak self] in
                self?.interactor.loadChangeCourse(with: courseModel())
                self?.interactor.loadDismiss()
            }
            
            setUpTextFields(with: model)
        } else {
            title = Constant.NavigationBar.createTitle
            continueButton.configure(title: Constant.ContinueButton.continueTitle)
            continueButton.action = { [weak self] in
                self?.interactor.loadCreateSchedule(with: courseModel())
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
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpContinueButton()
        setUpContentScrollView()
        setUpTextFields()
        setUpDurationPickerView()
        setUpLocationDurationStackView()
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
    
    private func setUpContinueButton() {
        view.addSubview(continueButton)
        continueButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constant.ContinueButton.bottomOffset)
        continueButton.pinHorizontal(to: view, Constant.ContinueButton.horizontalOffset)
    }
    
    private func setUpContentScrollView() {
        view.addSubview(contentScrollView)
        contentScrollView.pinTop(to: navigationBar.bottomAnchor)
        contentScrollView.pinHorizontal(to: view, Constant.ContentScrollView.horizontalOffset)
        contentScrollView.pinBottom(to: continueButton.topAnchor, Constant.ContentScrollView.bottomOffset)
    }
    
    private func setUpTextFields() {
        nameTextField.configure(with: ITCHCourseEditorTextFieldConfig.name())
        locationTextField.configure(with: ITCHCourseEditorTextFieldConfig.location())
        durationTextField.configure(with: ITCHCourseEditorTextFieldConfig.duration())
        
        durationTextField.insteadKeyboardAction = { [weak self] in
            guard let self else { return }
            present(self.durationAlertController, animated: true)
        }
    
        chatLinkTextField.configure(with: ITCHCourseEditorTextFieldConfig.chatLink())
        gradesLinkTextField.configure(with: ITCHCourseEditorTextFieldConfig.gradesLink())
    }
    
    private func setUpLocationDurationStackView() {
        locationDurationStackView.axis = Constant.LocationDurationStack.axis
        locationDurationStackView.spacing = Constant.LocationDurationStack.spacing
        locationDurationStackView.distribution = Constant.LocationDurationStack.distribution
        locationDurationStackView.setWidth(view.frame.width - Constant.LocationDurationStack.horizontalPadding)
        [locationTextField, durationTextField].forEach { element in
            locationDurationStackView.addArrangedSubview(element)
        }
    }
    
    private func setUpTextFields(with model: ITCHCourseEditorModel) {
        nameTextField.text = model.name
        locationTextField.text = model.location
        chatLinkTextField.text = model.chatLink
        gradesLinkTextField.text = model.gradesLink
        durationTextField.text = model.duration
        durationTextField.setInputView(nil)
        
        let numbers = model.duration
            .components(separatedBy: ", ")
            .compactMap { Int($0) }

        selectedStart = numbers[0] - 1
        selectedEnd = numbers.count - 1
        
        safeSelectRow(selectedStart, in: .start)
        safeSelectRow(selectedEnd, in: .end)
    }
    
    private func safeSelectRow(_ row: Int, in component: ITCHDurationPickerComponent) {
        let componentIndex = component.rawValue
        let rowCount = durationPickerView.numberOfRows(inComponent: componentIndex)
        
        guard rowCount > 0 else { return }
        
        let safeRow = min(max(0, row), rowCount - 1)
        durationPickerView.selectRow(safeRow, inComponent: componentIndex, animated: true)
    }
    
    private func setUpContentStackView() {
        contentStackView.axis = Constant.ContentStack.axis
        contentStackView.spacing = Constant.ContentStack.spacing
        [nameTextField, locationDurationStackView, chatLinkTextField, gradesLinkTextField].forEach { element in
            contentStackView.addArrangedSubview(element)
        }
        
        contentScrollView.addSubview(contentStackView)
        contentStackView.pinTop(to: contentScrollView, Constant.ContentStack.topOffset)
        contentStackView.pinHorizontal(to: contentScrollView)
    }
    
    private func setUpDurationPickerView() {
        let wrapView = UIView()
        
        durationAlertController.view.addSubview(wrapView)
        wrapView.pinTop(to: durationAlertController.view, Constant.DurationPicker.topOffset)
        wrapView.pinCenterX(to: durationAlertController.view)
        wrapView.setWidth(view.bounds.width - Constant.DurationPicker.horizontalPadding)
        wrapView.setHeight(Constant.DurationPicker.height)
        
        setUpDurationPicker()
        wrapView.addSubview(durationPickerView)
        
        let confirmAction = makeConfirmAction()
        
        durationAlertController.addAction(confirmAction)
        durationAlertController.addAction(UIAlertAction(title: Constant.DurationPicker.cancelButtonTitle, style: .cancel))
    }
    
    private func setUpDurationPicker() {
        durationPickerView.frame = CGRect(
            x: Constant.DurationPicker.x,
            y: Constant.DurationPicker.y,
            width: view.frame.width - Constant.DurationPicker.horizontalPadding,
            height: Constant.DurationPicker.height
        )

        durationPickerView.dataSource = self
        durationPickerView.delegate = self
    }
    
    // MARK: - Actions
    private func makeConfirmAction() -> UIAlertAction {
        return UIAlertAction(title: Constant.DurationPicker.confirmButtonTitle, style: .default) { [weak self] _ in
            guard let self else { return }
            
            var text = ""
            for module in selectedStart...selectedEnd {
                text += "\(module)" + (module == selectedEnd ? "" : ", ")
            }
            
            self.durationTextField.text = text
        }
    }
}

// MARK: - UIPickerViewDelegate
extension ITCHCourseEditorViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let module = modules[row]
        switch component {
        case 0:
            selectedStart = module
            if selectedEnd < selectedStart {
                selectedEnd = selectedStart
                pickerView.selectRow(row, inComponent: 1, animated: true)
            }
        case 1:
            selectedEnd = module
            if selectedStart > selectedEnd {
                selectedStart = selectedEnd
                pickerView.selectRow(row, inComponent: 0, animated: true)
            }
        default:
            break
        }
    }
}

// MARK: - UIPickerViewDataSource
extension ITCHCourseEditorViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        Constant.DurationPicker.numberOfColumns
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        modules.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(modules[row])"
    }
}

//
//  ITCHNotificationTextViewController.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHNotificationTextViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundDark.color
        }
        
        enum ScrollView {
            static let showsVerticalScrollIndicator: Bool = false
        }
        
        enum ContentView {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 16
            static let verticalOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
            static let horizontalOffsets: CGFloat = 32
        }
        
        enum InfoStack {
            static let titleFont: UIFont = ITCHFont.bodyMMedium.font
            static let titleTextColor: UIColor = ITCHColor.base0.color
            static let titleNumberOfLines: Int = 0
            static let dateFont = ITCHFont.bodySMedium.font
            static let dateTextColor = ITCHColor.base30.color
            static let dateFormat: String = "yy.MM.dd 'в' HH:mm"
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 12
            static let alignment: UIStackView.Alignment = .leading
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 20
        }
        
        enum TextWrapView {
            static let backgroundColor: UIColor = ITCHColor.tabBar.color
            static let cornerRadius: CGFloat = 4
            static let topOffset: CGFloat = 12
            static let bottomOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 8
        }
        
        enum Text {
            static let font: UIFont = ITCHFont.bodyMRegular.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let numberOfLines: Int = 0
            static let offset: CGFloat = 12
        }
        
        enum Delete {
            static let title: String = "Удалить"
            static let image: UIImage = ITCHImage.trash20.image
            static let attributes: UIMenu.Attributes = [.destructive]
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHNotificationTextBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let scrollView: UIScrollView = UIScrollView()
    private let contentView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    private let infoStack: UIStackView = UIStackView()
    private let textWrapView: UIView = UIView()
    private let textLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    init(interactor: ITCHNotificationTextBusinessLogic) {
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
    func displayStart(with model: ITCHNotificationTextModel) {
        titleLabel.text = model.title
        dateLabel.text = model.date.configure(to: Constant.InfoStack.dateFormat)
        textLabel.text = model.text
        
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: model.type.text,
                leftImage: ITCHImage.chevronLeft24.image,
                rightImage: ITCHImage.options24.image
            )
        )
    }

    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        
        setUpNavigationBar()
        setUpScrollView()
        setUpContentView()
        setUpInfoStack()
        setUpTextWrapView()
        setUpTextLabel()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        navigationBar.configureRightButtonMenu(items: [deleteAction()])
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpScrollView() {
        scrollView.showsVerticalScrollIndicator = Constant.ScrollView.showsVerticalScrollIndicator
        
        view.addSubview(scrollView)
        scrollView.pinTop(to: navigationBar.bottomAnchor)
        scrollView.pinHorizontal(to: view)
        scrollView.pinBottom(to: view.bottomAnchor)
    }
    
    private func setUpContentView() {
        contentView.backgroundColor = Constant.ContentView.backgroundColor
        contentView.layer.cornerRadius = Constant.ContentView.cornerRadius
        
        scrollView.addSubview(contentView)
        contentView.pinVertical(to: scrollView, Constant.ContentView.verticalOffset)
        contentView.pinHorizontal(to: scrollView, Constant.ContentView.horizontalOffset)
        contentView.setWidth(view.bounds.width - Constant.ContentView.horizontalOffsets)
    }
    
    private func setUpInfoStack() {
        titleLabel.font = Constant.InfoStack.titleFont
        titleLabel.textColor = Constant.InfoStack.titleTextColor
        titleLabel.numberOfLines = Constant.InfoStack.titleNumberOfLines
        
        dateLabel.font = Constant.InfoStack.dateFont
        dateLabel.textColor = Constant.InfoStack.dateTextColor
        
        [titleLabel, dateLabel].forEach { infoStack.addArrangedSubview($0) }
        
        infoStack.axis = Constant.InfoStack.axis
        infoStack.spacing = Constant.InfoStack.spacing
        infoStack.alignment = Constant.InfoStack.alignment
        
        contentView.addSubview(infoStack)
        infoStack.pinTop(to: contentView, Constant.InfoStack.topOffset)
        infoStack.pinHorizontal(to: contentView, Constant.InfoStack.horizontalOffset)
    }
    
    private func setUpTextWrapView() {
        textWrapView.backgroundColor = Constant.TextWrapView.backgroundColor
        textWrapView.layer.cornerRadius = Constant.TextWrapView.cornerRadius
        
        contentView.addSubview(textWrapView)
        textWrapView.pinTop(to: infoStack.bottomAnchor, Constant.TextWrapView.topOffset)
        textWrapView.pinBottom(to: contentView, Constant.TextWrapView.bottomOffset)
        textWrapView.pinHorizontal(to: contentView, Constant.TextWrapView.horizontalOffset)
    }
    
    private func setUpTextLabel() {
        textLabel.font = Constant.Text.font
        textLabel.textColor = Constant.Text.textColor
        textLabel.numberOfLines = Constant.Text.numberOfLines
        
        textWrapView.addSubview(textLabel)
        textLabel.pin(to: textWrapView, Constant.Text.offset)
    }
    
    // MARK: - Actions
    func deleteAction() -> UIAction {
        UIAction(
            title: Constant.Delete.title,
            image: Constant.Delete.image,
            attributes: Constant.Delete.attributes
        ) { [weak self] _ in
            self?.interactor.loadDismiss()
        }
    }
}

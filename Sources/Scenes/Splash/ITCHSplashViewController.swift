//
//  ViewController.swift
//  IT-ch
//
//  Created by Peter on 06.02.2025.
//

import UIKit
import ITCHUIComponents
import ITCHAuthorization
import ITCHControllers

final class ITCHSplashViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        static let logoImage: UIImage? = UIImage.logo
    }
    
    // MARK: - Private fields
    private let interactor: ITCHSplashBusinessLogic
    private let logoImageView: UIImageView = UIImageView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHSplashBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.checkAuth()
    }
    
    // MARK: - SetUp
    private func setUp() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = Constant.backgroundColor
        setUpLogoImageView()
    }
    
    private func setUpLogoImageView() {
        logoImageView.image = Constant.logoImage
        
        view.addSubview(logoImageView)
        logoImageView.pinCenter(to: view)
    }
}

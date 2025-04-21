//
//  ViewController.swift
//  IT-ch
//
//  Created by Peter on 06.02.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSplashViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        static let logoImage: UIImage? = UIImage.logo
    }
    
    // MARK: - Properties
    private let logoImageView: UIImageView = UIImageView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.backgroundColor
        setUpLogoImageView()
    }
    
    private func setUpLogoImageView() {
        logoImageView.image = Constant.logoImage
        
        view.addSubview(logoImageView)
        logoImageView.pinCenter(to: view)
    }
}

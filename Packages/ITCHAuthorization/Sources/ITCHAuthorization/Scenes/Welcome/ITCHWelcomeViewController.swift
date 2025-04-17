//
//  ITCHWelcomViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit
import ITCHUIComponents

public final class ITCHWelcomeViewController: UIViewController {    
    // MARK: - UI Components
    private let button: ITCHButton = ITCHButton(title: "Далее")
    
    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
    }
}

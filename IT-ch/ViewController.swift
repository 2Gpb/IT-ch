//
//  ViewController.swift
//  IT-ch
//
//  Created by Peter on 06.02.2025.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Private fields
    private let button: UIButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "24282C")
        
        button.apply(StylesManager.shared.style(for: .primaryButton))
        button.setTitle("Войти через ЕЛК", for: .normal)
        
        view.addSubview(button)
        button.pinCenterY(to: view)
        button.pinHorizontal(to: view, 16)
        button.setHeight(48)
    }
}

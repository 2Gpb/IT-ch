//
//  ViewController.swift
//  IT-ch
//
//  Created by Peter on 06.02.2025.
//

import UIKit
import ITCHUIComponents

final class ViewController: UIViewController {
    // MARK: - Private fields
    private let button: UIButton = UIButton(type: .system)
    private let label: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "FFFFFF")
        
        label.text = "good"
        label.textColor = .black
        label.font = ITCHFont.header3.font
        
        view.addSubview(label)
        label.pinCenter(to: view)
    }
}

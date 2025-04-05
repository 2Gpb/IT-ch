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
    private let image: UIImageView = UIImageView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ITCHColor.backgroundGray.color
        
        label.text = "good"
        label.textColor = ITCHColor.red50.color
        label.font = ITCHFont.header3.font
        
        image.image = ITCHImage.appearance32.image
        
        view.addSubview(image)
        image.pinCenter(to: view)
    }
}

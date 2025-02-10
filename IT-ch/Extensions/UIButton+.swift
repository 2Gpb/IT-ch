//
//  UIView+.swift
//  IT-ch
//
//  Created by Peter on 09.02.2025.
//

import UIKit

extension UIButton {
    func apply(_ style: Style?) {
        guard let style else { return }
        layer.cornerRadius = style.cornerRadius ?? 0
        backgroundColor = UIColor(hex: style.backgroundColor)
        setTitleColor(UIColor(hex: style.textColor ?? "FFFFFF"), for: .normal)
    }
}

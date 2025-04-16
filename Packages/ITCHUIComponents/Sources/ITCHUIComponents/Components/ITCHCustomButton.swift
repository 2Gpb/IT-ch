//
//  ITCHCustomButton.swift
//  ITCHUIComponents
//
//  Created by Peter on 06.04.2025.
//

import UIKit

final class ITCHCustomButton: UIButton {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return bounds.insetBy(dx: -16, dy: -16).contains(point)
    }
}

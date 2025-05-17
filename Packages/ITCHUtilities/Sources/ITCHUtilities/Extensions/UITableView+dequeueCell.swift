//
//  UITableView+dequeueCell.swift
//  ITCHUtilities
//
//  Created by Peter on 13.05.2025.
//

import UIKit

public extension UITableView {
    func dequeueCell<T: UITableViewCell>(
        for indexPath: IndexPath
    ) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseId) as \(T.self)")
        }
        return cell
    }
}

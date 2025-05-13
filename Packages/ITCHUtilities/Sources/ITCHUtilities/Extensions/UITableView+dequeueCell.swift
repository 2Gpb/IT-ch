//
//  UITableView+dequeueCell.swift
//  ITCHUtilities
//
//  Created by Peter on 13.05.2025.
//

import UIKit

public extension UITableView {
    func dequeueCell<T: UITableViewCell & Reusable>(
        for indexPath: IndexPath
    ) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
    }
}

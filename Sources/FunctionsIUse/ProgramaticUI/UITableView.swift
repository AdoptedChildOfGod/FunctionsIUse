//
//  File.swift
//  
//
//  Created by Shannon Draeker on 10/6/20.
//

import UIKit

extension UITableView {
    /// Reload the tableview so that it will automatically set the height of each row
    func resize() {
        // Auto resize the table view with dynamic row heights
        reloadData()
        setNeedsLayout()
        layoutIfNeeded()
        layoutSubviews()
        reloadData()
    }
}

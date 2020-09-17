//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import UIKit

extension UIStackView {

    convenience init(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat? = nil) {
        self.init()
        
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        if let spacing = spacing { self.spacing = spacing }
    }
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

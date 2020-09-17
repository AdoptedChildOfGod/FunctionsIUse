//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import Foundation

extension UIImageView {
    convenience init(_ image: UIImage?, tintColor: UIColor? = nil, contentMode: ContentMode = .scaleAspectFill) {
        self.init()
        
        if #available(iOS 13.0, *), let tintColor = tintColor {
            self.image = image?.withTintColor(tintColor)
        } else {
            self.image = image
        }
        
        self.contentMode = contentMode
    }
}

//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import UIKit

extension UIButton {
    func setUpViews(_ title: String,
                    titleColor: UIColor = .white,
                    background: UIColor = .clear,
                    fontSize: CGFloat = 18,
                    fontName: FontNames = .regular,
                    cornerRadius: CGFloat = 6,
                    borderColor: UIColor? = nil,
                    borderSize: CGFloat = 0,
                    padding: [CGFloat]? = nil,
                    alignmentX: UIControl.ContentHorizontalAlignment = .center,
                    alignmentY: UIControl.ContentVerticalAlignment = .center) {
        // The title
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        
        // The font
        if let customFont = UIFont(name: fontName.rawValue, size: fontSize) {
            titleLabel?.font = customFont
        } else { titleLabel?.font = UIFont(name: titleLabel!.font!.familyName, size: fontSize) }
        
        // The background
        backgroundColor = background
        
        // Round the corners
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
        // The border
        if let borderColor = borderColor {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderSize
        }
        
        // The alignment
        contentHorizontalAlignment = alignmentX
        contentVerticalAlignment = alignmentY
        
        // Add padding
        if let padding = padding {
            contentEdgeInsets = UIEdgeInsets(top: padding[0], left: padding[1], bottom: padding[2], right: padding[3])
        }
    }
}

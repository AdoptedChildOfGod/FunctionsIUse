//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import UIKit

// MARK: - Format a view

extension UIView {
    convenience init(color: UIColor, alpha: CGFloat = 1, cornerRadius: CGFloat? = nil) {
        self.init()
        setUpViews(color: color, alpha: alpha, cornerRadius: cornerRadius)
    }
    
    func setUpViews(color: UIColor, alpha: CGFloat = 1, cornerRadius: CGFloat? = nil) {
        // The background color
        backgroundColor = color.withAlphaComponent(alpha)
        
        // Round the corners
        if let cornerRadius = cornerRadius {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
}

// MARK: - Gradient on a View

extension UIView {
    /// Accepts an array of UIColor and creates a left to right gradient effect.
    func applyGradient(with colors: [UIColor]) {
        self.applyGradient(colors: colors, locations: [0.0, 1.0])
    }
    
    private func applyGradient(colors: [UIColor], locations: [NSNumber]?) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.name = "gradientLayer"
        layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - View Anchoring Constraints

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
    
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    /// Set constraints for the top, bottom, or sides of a view, or set the width or height to constant values
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingLeading: CGFloat = 0,
                paddingTrailing: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /// Anchor the center of a view or set the width or height to proportional values
    func anchor(centerX: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil,
                width: NSLayoutDimension? = nil,
                widthMultiplier: CGFloat = 1,
                height: NSLayoutDimension? = nil,
                heightMultiplier: CGFloat = 1) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier).isActive = true
        }
    }
    
    /// Anchor a view to a certain aspect ratio
    func anchor(aspectRatio: CGFloat = 1.0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: aspectRatio, constant: 0))
    }
    
    /// Set minimum or maximum values for the height or width of a view
    func anchor(minHeight: CGFloat? = nil,
                maxHeight: CGFloat? = nil,
                minWidth: CGFloat? = nil,
                maxWidth: CGFloat? = nil) {
        
         translatesAutoresizingMaskIntoConstraints = false
        
        if let minHeight = minHeight {
            heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight).isActive = true
        }
        if let maxHeight = maxHeight {
            heightAnchor.constraint(lessThanOrEqualToConstant: maxHeight).isActive = true
        }
        if let minWidth = minWidth {
            widthAnchor.constraint(greaterThanOrEqualToConstant: minWidth).isActive = true
        }
        if let maxWidth = maxWidth {
            widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth).isActive = true
        }
    }
}

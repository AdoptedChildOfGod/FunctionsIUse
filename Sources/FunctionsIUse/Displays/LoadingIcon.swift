//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import UIKit

extension UIView {
    /// Dim the screen and show a loading icon in the center of the screen
    func startLoadingIcon() {
        // Put a transparent view over everything to dim the screen
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: bounds.width, height: bounds.height)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        backgroundView.tag = 475647
        
        // Create a darker rounded square in the middle of the screen
        let squareView = UIView()
        squareView.frame = CGRect(x: bounds.width / 2 - 45,
                                  y: bounds.height / 2 - 45,
                                  width: 90, height: 90)
        squareView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        squareView.layer.cornerRadius = 18
        squareView.layer.masksToBounds = true
        squareView.tag = 475648
        
        // Format the loading icon and place it in the center of the square
        let activityIndicator = UIActivityIndicatorView(frame: backgroundView.frame)
        activityIndicator.center = backgroundView.center
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) { activityIndicator.style = .large }
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        
        // Don't allow the user to interact with the screen while it's loading
        isUserInteractionEnabled = false
        
        // Add the views to display the loading icon
        backgroundView.addSubview(squareView)
        backgroundView.addSubview(activityIndicator)
        addSubview(backgroundView)
    }
    
    /// Remove the loading icon from the screen
    func stopLoadingIcon() {
        // Remove the views from the screen
        if let backgroundView = viewWithTag(475647) {
            if let squareView = backgroundView.viewWithTag(475648) { squareView.removeFromSuperview() }
            backgroundView.removeFromSuperview()
        }
        // Allow the user to interact with the screen again
        isUserInteractionEnabled = true
    }
}

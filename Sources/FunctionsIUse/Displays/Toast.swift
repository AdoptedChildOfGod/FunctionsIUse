//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

extension UIViewController {
    
    /// How long to display the toast message
    enum ToastDuration: Double {
        case short = 2.0
        case medium = 4.0
        case long = 6.0
    }
    
    /// Display a message on the screen that automatically disappears after a few seconds, similar to android's toast functionality
    /// - Parameters:
    ///   - message: The text to display
    ///   - duration: Short (2 seconds), medium (4 seconds), or long (6 seconds)
    func showToast(message: String, duration: ToastDuration = .short) {
        // Create the text of the toast
        let toastLabel = UILabel(text: message, color: .white, fontSize: 18, alignment: .center)
        // toastLabel.adjustsFontSizeToFitWidth = true
        
        // Create the background
        let backgroundView = UIView(color: .black, alpha: 0.5, cornerRadius: 12)
        let width = min((toastLabel.intrinsicContentSize.width / 0.8), 150)
        let height = min(max((toastLabel.intrinsicContentSize.height / 0.8), 40), 80)
        backgroundView.frame = CGRect(x: (view.frame.size.width - width) / 2,
                                      y: view.frame.size.height - 100,
                                      width: width, height: height)
        
        // Add the text to the background
        backgroundView.addSubview(toastLabel)
        toastLabel.anchor(centerX: backgroundView.centerXAnchor,
                          centerY: backgroundView.centerYAnchor,
                          width: backgroundView.widthAnchor,
                          widthMultiplier: 0.8,
                          height: backgroundView.heightAnchor,
                          heightMultiplier: 0.8)
        
        // Display the toast message
        let window = UIApplication.shared.keyWindow!
        window.addSubview(backgroundView)
        UIView.animate(withDuration: 0.5, delay: duration.rawValue, options: .curveEaseOut, animations: {
            backgroundView.alpha = 0
            toastLabel.alpha = 0
        }, completion: { _ in
            backgroundView.removeFromSuperview()
        })
    }
}

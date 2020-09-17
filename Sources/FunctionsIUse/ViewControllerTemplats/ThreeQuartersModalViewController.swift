//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import UIKit

class ThreeQuartersModalViewController: UIViewController {
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        setUpBackgroundView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.2, delay: 0.2, options: [], animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        })
    }
    
    // MARK: - Actions
    /// Respond to user swipes and taps
    
    /// Dismiss the view when the user taps outside or swipes down near the handle bar
    @objc func dismissView() {
        DispatchQueue.main.async {
            self.view.backgroundColor = .clear
            self.dismiss(animated: true)
        }
    }
    
    /// Expand the view when the user swipes up near the handle bar
    @objc func expandToFullScreen() {
        UIView.animate(withDuration: 0.2) {
            let maxY = self.view.safeAreaLayoutGuide.layoutFrame.origin.y
            self.backgroundView.frame = CGRect(x: 0, y: maxY, width: self.view.frame.width, height: self.view.frame.height - maxY)
        }
    }
    
    // MARK: - UI Elements
    
    var backgroundView = UIView(color: .white)
    var bar = UIView(color: .black, alpha: 0.18, cornerRadius: 2)
    
    // MARK: - Set Up UI
    
    /// Set up the background view to look like a modal view controller at half height
    private func setUpBackgroundView() {
        // Set up taps and swipes so that the user can tap out of the view, swipe down to close it, or swipe up to expand
        let escapeTap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissView))
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(expandToFullScreen))
        escapeTap.delegate = self
        swipeDown.delegate = self
        swipeDown.direction = .down
        swipeUp.direction = .up
        view.addGestureRecognizer(escapeTap)
        view.addGestureRecognizer(swipeDown)
        
        // Set up the background view to be initially at 3/4 the height of the screen
        backgroundView = UIView(frame: CGRect(x: 0, y: view.frame.height * 0.25, width: view.frame.width, height: view.frame.height * 0.75))
        view.addSubview(backgroundView)
        // Round the top two corners
        backgroundView.layer.cornerRadius = 14
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundView.layer.masksToBounds = true
        
        // Create a rounded gray handle bar to mimic the appearance of a modal view controller
        backgroundView.addSubview(bar)
        bar.anchor(top: backgroundView.topAnchor, paddingTop: 18, width: 36, height: 5)
        bar.anchor(centerX: backgroundView.centerXAnchor)
        bar.clipsToBounds = true
        
        // Add an expanded area around the handle bar to look for taps and swipes
        let swipeArea = UIView()
        swipeArea.addGestureRecognizer(swipeUp)
        swipeArea.backgroundColor = .clear
        view.addSubview(swipeArea)
        swipeArea.anchor(top: backgroundView.topAnchor, paddingTop: -10, height: 100)
        swipeArea.anchor(centerX: backgroundView.centerXAnchor, width: backgroundView.widthAnchor)
    }
}

// MARK: - Gesture Delegate

extension ThreeQuartersModalViewController: UIGestureRecognizerDelegate {
    /// Only register taps outside of the colored part of the view
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: backgroundView) == true {
            return false
        }
        return true
    }
}

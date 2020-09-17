//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import UIKit

extension UIViewController {
    /// Present a simple alert with a message and a dismiss button
    func presentAlert(title: String, message: String, dismissButtonText: String = "Dismiss", completion: @escaping () -> Void = {}) {
        // Create the alert controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add the dismiss button to the alert
        alertController.addAction(UIAlertAction(title: dismissButtonText, style: .default, handler: { (_) in return completion() }))
        
        // Present the alert
        present(alertController, animated: true)
    }
    
    /// Present an alert that the internet connection isn't working
    func presentInternetAlert() {
        presentAlert(title: "No Internet Connection", message: "You must be connected to the internet in order to use Glance. Please check your internet connection and try again")
    }
    
    /// Present an alert with a message and confirm/cancel buttons
    func presentChoiceAlert(title: String, message: String, cancelText: String = "Cancel", confirmText: String = "Confirm", completion: @escaping () -> Void) {
        // Create the alert controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add the cancel button to the alert
        alertController.addAction(UIAlertAction(title: cancelText, style: .cancel))
        
        // Add the confirm button to the alert
        alertController.addAction(UIAlertAction(title: confirmText, style: .default, handler: { (_) in completion() }))
        
        // Present the alert
        present(alertController, animated: true)
    }
    
    /// Present an alert with a message, text field, and save/cancel buttons
    func presentTextFieldAlert(title: String, message: String, textFieldPlaceholder: String?, textFieldText: String? = nil, saveButtonTitle: String = "Save", completion: @escaping (String) -> Void) {
        // Create the alert controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add the text field
        alertController.addTextField { (textField) in
            textField.placeholder = textFieldPlaceholder
            if let textFieldText = textFieldText {
                textField.text = textFieldText
            }
        }
        
        // Create the cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // Create the save button
        let saveAction = UIAlertAction(title: saveButtonTitle, style: .default) { (_) in
            // Get the text from the text field
            guard let text = alertController.textFields?.first?.text, !text.isEmpty else { return }
            
            // Run the desired completion function with the text input
            completion(text)
        }
        
        // Add the buttons to the alert and present it
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true)
    }
    
    /// Present an alert to display an error
    func presentErrorAlert(_ localizedError: LocalizedError) {
        // Create the alert controller
        let alertController = UIAlertController(title: "ERROR", message: localizedError.errorDescription, preferredStyle: .alert)
        
        // Add the dismiss button to the alert
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        // Present the alert
        present(alertController, animated: true)
    }
    func presentErrorAlert(_ error: Error) {
           // Create the alert controller
        let alertController = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert)
           
           // Add the dismiss button to the alert
           alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
           
           // Present the alert
           present(alertController, animated: true)
       }
}

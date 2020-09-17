//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import Foundation

// Validate the formatting of an email
private let firstPart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
private let serverPart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
private let emailRegex = firstPart + "@" + serverPart + "[A-Za-z]{2,8}"
private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

// Validate that a password contains at least one uppercase letter, one lowercase letter, one number, one symbol, and is at least 8 characters long
private let passwordRegex = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[^A-Za-z0-9].*).{8,}"
private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)

// Add an extenstion to be able to validate the format of a string directly
extension String {
    func isEmail() -> Bool {
        return emailPredicate.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        return passwordPredicate.evaluate(with: self)
    }
    
    func isValidFullName() -> Bool {
        let fullName = self.components(separatedBy: " ")
        return fullName.count == 2 && !fullName[0].isEmpty && !fullName[1].isEmpty
    }
}

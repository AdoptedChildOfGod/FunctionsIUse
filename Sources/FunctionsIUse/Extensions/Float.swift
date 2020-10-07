//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import Foundation

// An extension with functions for some common types of number formatting I use
extension Float {
    /// Round a number to the specified number of decimal places
    func round(to decimalPlaces: Int) -> Float {
        let multiplier = pow(10.0, Float(decimalPlaces))
        return (self * multiplier).rounded() / multiplier
    }
    
    /// Format the number as a percentage with no decimal places
    var asPct: String { "\(Int(self * 100))%" }
    
    /// Format the number as an absolute value percentage with no decimal places
    var asPctAbs: String { "\(abs(Int(self * 100)))%" }
    
    /// Format the number with commas and at most two decimal places
    var commasTwoSigFigs: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
    
    /// Format the number as an abbreviation with at most one decimal place
    var abbreviatedFormat: String {
        if self >= 1000 && self < 1000000 {
            return ("\((self / 1000).round(to: 1))k").replacingOccurrences(of: ".0", with: "")
        } else if self > 1000000 {
            return ("\((self / 1000000).round(to: 1))M").replacingOccurrences(of: ".0", with: "")
        } else {
            return ("\(self.round(to: 0))").replacingOccurrences(of: ".0", with: "")
        }
    }
    
    /// Get the closest (larger) hundred to a number
    var closestHundred: Float {
        // If the number is already a perfect 100, return it
        if Int(self) % 100 == 0 {return self }
        // Otherwise, return the next highest hundred
        return (floor(self / 100) * 100) + 100
    }
}

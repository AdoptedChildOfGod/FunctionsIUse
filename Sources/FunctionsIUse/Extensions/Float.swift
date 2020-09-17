//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import Foundation

// An extension with functions for some common types of number formatting I use
extension Float {
    /// Round the number to the speficied number of decimal places
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
}

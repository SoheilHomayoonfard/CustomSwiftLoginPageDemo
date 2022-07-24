//
//  Helper.swift
//  firstApp
//
//  Created by Gandom on 7/19/22.
//

import Foundation

class Helper{
    
    static func isPhoneNumber(_ PhoneNumber: String) -> Bool {
        for char in PhoneNumber {
            let scalarValues = String(char).unicodeScalars
            let charAscii = scalarValues[scalarValues.startIndex].value
            if charAscii < 48 || charAscii > 57 {
                return false
            }
        }
        return true
    }
    
    
    
}

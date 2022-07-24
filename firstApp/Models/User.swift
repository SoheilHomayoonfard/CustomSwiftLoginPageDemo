//
//  User.swift
//  firstApp
//
//  Created by Gandom on 7/22/22.
//
import Foundation

struct User: Decodable{
    let Phone : String
    let Email : String
    let Password : String
    
    enum CodingKeys: String, CodingKey {
        case Phone = "phone_number"
        case Email = "email"
        case Password
    }
    
//    mutating func GenerateCode() {
//        self.ActivationCode = String(Int.random(in: 1000...9999))
//    }
//
//    func isActivationCodeCorrect (_ code: String) -> Bool{
//        return ActivationCode == code
//    }
    
}


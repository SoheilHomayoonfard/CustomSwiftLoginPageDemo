//
//  CompanyType.swift
//  firstApp
//
//  Created by Gandom on 7/24/22.
//
import Foundation

struct CompanyType : Decodable{
    let bourse : String
    let farabourse : String
    
    enum CodingKeys : String , CodingKey{
        case bourse = "bourse"
        case farabourse = "farabourse"
    }
}

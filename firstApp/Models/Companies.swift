//
//  Companies.swift
//  firstApp
//
//  Created by Gandom on 7/24/22.
//

import Foundation

struct Companies : Decodable{
    let count : Int
    let all : [Company]
    
    enum CodingKeys: String , CodingKey{
        case count
        case all = "most_visited_symbols"
    }
}

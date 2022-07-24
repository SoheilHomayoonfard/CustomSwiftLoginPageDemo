//
//  Company.swift
//  firstApp
//
//  Created by Gandom on 7/24/22.
//

import Foundation

struct Company: Decodable {
  let companyName: String
  let finalPrice : String
  let finalPriceChangePercent : String
  let lastTrade : String
  let lastTradeChangePercent : String
  let maximumPrice : String
  let minimumPrice : String
  let name : String
  let order : String
  let quntity : String
  let tseID : String
  let value : String
  let volume : String
    
  enum CodingKeys: String, CodingKey {
    case companyName = "company_name"
    case finalPrice = "final_price"
    case finalPriceChangePercent = "final_price_change_percent"
    case lastTrade = "last_trade"
    case lastTradeChangePercent = "last_trade_change_percent"
    case maximumPrice = "maximum_price"
    case minimumPrice = "minimum_price"
    case name
    case order
    case quntity
    case tseID = "tse_id"
    case value
    case volume
  }
}

protocol Displayable{
    
    var companyNameTitleLabel: String{ get }
    
    var finalPriceTitleLabel : String{ get }
    
    var finalPriceChangePercentTitleLabel : String{ get }
    
    var lastTradeTitleLabel : String{ get }
    
    var lastTradeChangePercentTitleLabel : String{ get }
    
    var maximumPriceTitleLabel : String{ get }
    
    var minimumPriceTitleLabel : String{ get }
    
    var nameTitleLabel : String{ get }
    
    var orderTitleLabel : String{ get }
    
    var quntityTitleLabel : String{ get }
    
    var tseIDTitleLabel : String{ get }
    
    var valueTitleLabel : String{ get }
    
    var volumeTitleLabel : String{ get }
    
}
 
extension Company : Displayable {
    var companyNameTitleLabel: String{
        companyName
    }
    var finalPriceTitleLabel : String{
        "last price -> \(finalPrice)"
    }
    var finalPriceChangePercentTitleLabel : String{
        "last price change percent -> \(finalPriceChangePercent)"
    }
    var lastTradeTitleLabel : String{
        "last trade price -> \(lastTrade)"
    }
    var lastTradeChangePercentTitleLabel : String{
        "last trade price change percent -> \(lastTradeChangePercent)"
    }
    var maximumPriceTitleLabel : String{
        "maximum price -> \(maximumPrice)"
    }
    var minimumPriceTitleLabel : String{
        "minimum price -> \(minimumPrice)"
    }
    var nameTitleLabel : String{
        "Pruduct name -> \(name)"
    }
    var orderTitleLabel : String{
        "number of orders -> \(order)"
    }
    var quntityTitleLabel : String{
        "number of product -> \(quntity)"
    }
    var tseIDTitleLabel : String{
        "tes id -> \(tseID)"
    }
    var valueTitleLabel : String{
        "value -> \(value)"
    }
    var volumeTitleLabel : String{
        "volume -> \(volume)"
    }
}



//
//  Company.swift
//  firstApp
//
//  Created by Gandom on 7/24/22.
//
import Foundation

struct InstrumentEffect: Decodable {
  let effect : Double
  let finalPrice : Int
  let name : String
  let order : Int
  let tseID : Int
    
  enum CodingKeys: String, CodingKey {
    case effect
    case finalPrice = "final_price"
    case name
    case order
    case tseID = "tse_id"
  }
}

protocol Displayable{
    var finalPriceTitleLabel : String{ get }
    
    var nameTitleLabel : String{ get }
    
    var orderTitleLabel : String{ get }
    
    var tseIDTitleLabel : String{ get }
}
 

extension InstrumentEffect : Displayable {
    var finalPriceTitleLabel : String{
        "last price -> \(finalPrice)"
    }
    var nameTitleLabel : String{
        "Pruduct name -> \(name)"
    }
    var orderTitleLabel : String{
        "number of orders -> \(order)"
    }
    var tseIDTitleLabel : String{
        "tse id -> \(tseID)"
    }
}

struct mostVisitedSymbols: Decodable {
  let companyName: String
  let finalPrice : Int
  let finalPriceChangePercent : Double
  let lastTrade : Int
  let lastTradeChangePercent : Double
  let maximumPrice : Int
  let minimumPrice : Int
  let name : String
  let order : Int
  let quntity : Int?
  let tseID : Int
  let value : Int
  let volume : Int
    
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


struct selectedIndices: Decodable {
  let amount: Double
  let change : Double
  let changePercent : Double
  let maximum : Double
  let minimum : Double
  let name : String
  let order : Int
  let publishment : String
    
  enum CodingKeys: String, CodingKey {
    case amount
    case change
    case changePercent = "change_percent"
    case maximum
    case minimum
    case name
    case order
    case publishment
  }
}


struct bourseSummery: Decodable {
    let marketValue : Int
    let overallIndex : Double
    let overallIndexChange : Double
    let overallIndexChangePercent : Double
    let overallIndexWeight : Double
    let overallIndexWeightChange : Double
    let overallIndexWeightChangePercent : Double
    let pricesData : String
    let state : String
    let tradesQuantity : Int
    let tradesValue : Int
    let tradesVolume : Int
    
  enum CodingKeys: String, CodingKey {
      case marketValue = "market_value"
      case overallIndex = "overall_index"
      case overallIndexChange = "overall_index_change"
      case overallIndexChangePercent = "overall_index_change_percent"
      case overallIndexWeight = "overall_index_weight"
      case overallIndexWeightChange = "overall_index_weight_change"
      case overallIndexWeightChangePercent = "overall_index_weight_change_percent"
      case pricesData = "prices_data"
      case state = "state"
      case tradesQuantity = "trades_quantity"
      case tradesValue = "trades_value"
      case tradesVolume = "trades_volume"
  }
}

struct farabourseSummery: Decodable {
  let baseMarketValue: Int
  let marketValue : Int
  let overallIndex : Double
  let overallIndexChange : Double
  let overallIndexChangePercent : Double
  let pricesData : String
  let state : String
  let tradesQuantity : Int
  let tradesValue : Int
  let tradesVolume : Int
    
  enum CodingKeys: String, CodingKey {
    case baseMarketValue = "base_market_value"
    case marketValue = "market_value"
    case overallIndex = "overall_index"
    case overallIndexChange = "overall_index_change"
    case overallIndexChangePercent = "overall_index_change_percent"
    case pricesData = "prices_data"
    case state = "state"
    case tradesQuantity = "trades_quantity"
    case tradesValue = "trades_value"
    case tradesVolume = "trades_volume"
  }
}



    
    

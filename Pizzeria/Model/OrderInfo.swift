//
//  OrderInfo.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-16.
//

import Foundation

class OrderInfo: NSObject, NSCoding{
    func encode(with coder: NSCoder) {
        coder.encode(breadType, forKey: "breadType")
        coder.encode(cheeseType, forKey: "cheeseType")
        coder.encode(sauceType, forKey: "sauceType")
        coder.encode(toppings, forKey: "toppings")
        coder.encode(orderDate, forKey: "orderDate")
    }
    
    required init?(coder: NSCoder) {
        breadType = (coder.decodeObject(forKey: "breadType") as! String)
        cheeseType = (coder.decodeObject(forKey: "cheeseType") as! String)
        sauceType = (coder.decodeObject(forKey: "sauceType") as! String)
        toppings = coder.decodeObject(forKey: "toppings") as! [String]
        orderDate = (coder.decodeObject(forKey: "orderDate") as! String)
    }
    
    
   var breadType:String!
  var cheeseType:String!
    var sauceType:String!
    var toppings:[String]
    var orderDate:String!
    
    
    init(breadType:String,cheeseType:String,sauceType:String,toppings:[String], orderDate:String) {
        self.breadType = breadType
        self.cheeseType = cheeseType
        self.sauceType = sauceType
        self.toppings = toppings
        self.orderDate = orderDate
    }
   
}

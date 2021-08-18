//
//  DataModel.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-16.
//

import Foundation

class DataModel{
    
    func getOrders() ->[OrderInfo]{
        var orders = [OrderInfo]()
        
        let info = OrderInfo(breadType: "Thick Crust", cheeseType: "No cheese", sauceType: "BBQ", toppings: ["chicken","onion"], orderDate: "20/06/2021")
        
        orders.append(info)
        orders.append(info)
        orders.append(info)
        orders.append(info)
        return orders
    }
        func getBreads() -> [String]{
            var breads = [String]()
            breads.append("Thick Crust")
            breads.append("Thin Crust")
            breads.append("Normal Crust")
            return breads;
        }
    func getCheese() -> [String]{
        var cheeses = [String]()
        cheeses.append("No cheese")
        cheeses.append("Mozzarella")
        cheeses.append("Parmesan")
        cheeses.append("Cheddar")
        return cheeses;
    }

    func getSauce() -> [String]{
        var sauces = [String]()
        sauces.append("BBQ")
        sauces.append("Creamy Garlic")
        sauces.append("Pesto")
        sauces.append("Italian Tomato")
        return sauces;
    }
    
}

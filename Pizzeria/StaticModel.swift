//
//  StaticModel.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-17.
//

import Foundation
//Global Variable
struct Pizzeria_GlobalVariable {
   
    
    static var orders : [OrderInfo] = []
    static var ordersList = OrderList()
    
    init() {
        // load the data from archive.
        let  ordersURL: URL = {
            let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentDirectory = documentDirectories.first!
            return documentDirectory.appendingPathComponent("orders.archive")
        }()
        
        do{
        let data = try Data(contentsOf: ordersURL)
            Pizzeria_GlobalVariable.orders = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [OrderInfo]
        }
        catch{
            
        }
    }
}


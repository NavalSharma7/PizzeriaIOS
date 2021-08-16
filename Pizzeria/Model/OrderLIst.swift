//
//  OrderLIst.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-16.
//

import Foundation


class OrderList{
    var orders = [OrderInfo]()
    
    // url for archiving
    
    let  ordersURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("orders.archive")
    }()
    
    init() {
          
        var dateComp = DateComponents()
        dateComp.year = 2021
        dateComp.day = 15
        dateComp.month = 8
        // Create date from components
        let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
        let date = userCalendar.date(from: dateComp)
        
        let info = OrderInfo(breadType: "Thick Crust", cheeseType: "No cheese", sauceType: "BBQ", toppings: ["chicken","onion"], orderDate: date!)
        
        orders.append(info)
        orders.append(info)
        orders.append(info)
        orders.append(info)
    }
    
    // function to remove a values from the list
    
    func removeOrder(index: Int){
        orders.remove(at: index)
    }
    
    // function to save data
    func save() -> Bool{
        do{
       let data =  NSKeyedArchiver.archivedData(withRootObject: orders, requiringSecureCoding: false)
            try data.write(to: ordersURL)
        }
        catch{
            return false
        }
        return true
    }
}

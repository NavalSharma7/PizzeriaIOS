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
          
        // load the data from archive.
        do{
        let data = try Data(contentsOf: ordersURL)
          orders = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [OrderInfo]
        }
        catch{
            
        }
    }
    
    // function to remove a values from the list
    
    func removeOrder(index: Int){
        orders.remove(at: index)
        Pizzeria_GlobalVariable.ordersList.orders = orders
    }
    
    // function to save data
    @discardableResult func save() -> Bool{
        do{
       let data =  try NSKeyedArchiver.archivedData(withRootObject: orders, requiringSecureCoding: false)
            try data.write(to: ordersURL)
        }
        catch{
            print("Couldn't save data")
            return false
        }
        print("Data Saved")
        return true
    }
}

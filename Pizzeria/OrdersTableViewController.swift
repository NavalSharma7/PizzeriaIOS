//
//  OrdersTableViewController.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-15.
//

import UIKit

class OrdersTableViewController: UITableViewController {

    var orders: [OrderInfo] = []
    
   
   //MARK : outlets
    @IBOutlet var orderTableView: OrderTableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orders =  Pizzeria_GlobalVariable.ordersList.orders
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        self.tableView.register(OrdersTableViewCell.self, forCellReuseIdentifier: "orderItem")
//        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orders.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "orderItem", for: indexPath) as! OrdersTableViewCell
        
        // configure the cell
        
        let order = orders[indexPath.row]
        // set the values in UI
        cell.Ingrediant1!.text = order.breadType
        cell.Ingrediant2!.text = order.cheeseType
        cell.Ingrediant3!.text = order.sauceType
        cell.Ingrediant4!.text = order.toppings.first
        cell.Date.text = order.orderDate
        
       
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            orders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Pizzeria_GlobalVariable.ordersList.orders = orders
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   performSegue(withIdentifier: "OrderClick", sender: indexPath.row)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "OrderClick" {
//            let vc: OrderDetailsViewController = segue.destination as! OrderDetailsViewController
//            vc.index = (sender as? Int)!
//               }
//    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    
   
}


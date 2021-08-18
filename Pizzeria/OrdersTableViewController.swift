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
        orders = getOrders()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        tableView.register(UINib.init(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "orderItem")
        
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
       
        orderTableView.register(UITableViewCell.self, forCellReuseIdentifier: "orderItem")
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderItem", for: indexPath) as! OrdersTableViewCell

        // configure the cell
        
        let order = orders[indexPath.row]
        
        // set the values in UI
        cell.setOrder(order: order)
        
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
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       var order:OrderInfo = orders[indexPath.row]
        
        performSegue(withIdentifier: "OrderClick", sender: order)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OrderClick" {
            let vc: OrderDetailsViewController = segue.destination as! OrderDetailsViewController
                   vc.order = sender as? OrderInfo
               }
    }
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
    
    // dummy data method
    func getOrders() ->[OrderInfo]{
        var orders = [OrderInfo]()
        
        let info = OrderInfo(breadType: "Thick Crust", cheeseType: "No cheese", sauceType: "BBQ", toppings: ["chicken","onion"], orderDate: "20/06/2021")
        
        orders.append(info)
        orders.append(info)
        orders.append(info)
        orders.append(info)
        return orders
    }
    
   
}


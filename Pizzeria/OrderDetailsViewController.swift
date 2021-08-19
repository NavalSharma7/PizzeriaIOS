//
//  OrderDetailsViewController.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-16.
//

import UIKit

class OrderDetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    var order : OrderInfo!
    var ingredients = [String]()
    
    var index : Int = 0
    var ordersList = Pizzeria_GlobalVariable.ordersList
    //MARK: Outlets and actions
    @IBAction func ReorderButton(_ sender: Any) {
        // send the segue
        
        
       
        ordersList.orders.append(order)
        ordersList.save()
        Pizzeria_GlobalVariable.ordersList = ordersList
        performSegue(withIdentifier: "Reorder", sender: order)

    }
    
    @IBAction func EditButton(_ sender: Any) {
    }
    @IBOutlet weak var IngrediantsTable: OrderIngrediantsTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        order = ordersList.orders[index]

        // Do any additional setup after loading the view.
        
       
        let breadtype:String = order.breadType
        let cheesetype:String = order.cheeseType
        let saucetype:String = order.sauceType
        
        
        
        // set the ingrediant values of orderinfo in the tablee view
        
        ingredients.append(breadtype)
        ingredients.append(cheesetype)
        ingredients.append(saucetype)
        let topping : [String] = order.toppings
        
        for String in topping {
            ingredients.append(String)
        }
        ordersList.orders.append(order)
        ordersList.save()
        Pizzeria_GlobalVariable.ordersList = ordersList
    }
   
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Reorder" {
        let _: OrdersTableViewController = segue.destination as! OrdersTableViewController
               
           }
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredients", for: indexPath) as UITableViewCell

                cell.textLabel?.text = ingredients[indexPath.row]

                return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  OrderDetailsViewController.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-16.
//

import UIKit

class OrderDetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    var order :OrderInfo!
    var ingredients = [String]()
    
    //MARK: Outlets and actions
    @IBAction func ReorderButton(_ sender: Any) {
    }
    
    @IBAction func EditButton(_ sender: Any) {
    }
    @IBOutlet weak var IngrediantsTable: OrderIngrediantsTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        
        // test
        var dateComp = DateComponents()
        dateComp.year = 2021
        dateComp.day = 15
        dateComp.month = 8
        // Create date from components
        let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
        let date = userCalendar.date(from: dateComp)
        order = OrderInfo(breadType: "Thick Crust", cheeseType: "No cheese", sauceType: "BBQ", toppings: ["chicken, extra cheese, beef"], orderDate: "20/09/2021")
        
        
        
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

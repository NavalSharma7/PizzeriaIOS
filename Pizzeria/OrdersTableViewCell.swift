//
//  OrdersTableViewCell.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-17.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    
    
    //MARK: Outlets
    @IBOutlet weak var Ingrediant1: UILabel?
    @IBOutlet weak var Ingrediant2: UILabel?
    @IBOutlet weak var Ingrediant3: UILabel?
    @IBOutlet weak var Ingrediant4: UILabel?
    @IBOutlet weak var Date: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // functiont to set the order values to the view 
    func setOrder(order: OrderInfo){
        
        
//        Ingrediant1?.text = order.breadType
//        Ingrediant2?.text = order.cheeseType
//        Ingrediant3?.text = order.sauceType
//        Ingrediant4?.text = order.toppings.first
        
    }
    
    

}

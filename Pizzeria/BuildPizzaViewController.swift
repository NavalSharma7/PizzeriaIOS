//
//  BuildPizzaViewController.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-16.
//

import UIKit

class BuildPizzaViewController: UIViewController, radioButtonClickedTableDelegate  {
    func radioButtunClickedInTable(button: RadioButton) {
        setValuesfromRadioClick(value: button.titleLabel?.text ?? "")
    }
    var ordersList = Pizzeria_GlobalVariable.ordersList
        var info:OrderInfo
        
    
    
    var toppings : [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.info = OrderInfo(breadType: "", cheeseType: "", sauceType: "", toppings: [], orderDate: "")
        super.init(coder: aDecoder)
    }
    

    

   //MARK: IB outlets
    
    
    @IBOutlet weak var ChickenSW: UISwitch!
    
    @IBOutlet weak var BeefSW: UISwitch!
    
    @IBOutlet weak var OnionSW: UISwitch!
    @IBOutlet weak var PepperoniSW: UISwitch!
    @IBOutlet weak var BreadRadiioButton: RadioButtonView!
    
    @IBOutlet weak var MushroomSW: UISwitch!
    @IBOutlet weak var CheeseRadioButton: RadioButtonView!
    @IBOutlet weak var SauceRadioButton: RadioButtonView!
    
    @IBAction func orderButton(_ sender: Any) {
        
        // get other values from the form
        
        if ChickenSW.isOn{
        toppings.append("Chicken")
        
        }
        if BeefSW.isOn{
        toppings.append("Beef")
        
        }
        if PepperoniSW.isOn{
        toppings.append("Pepperoni")
        
        }
        if OnionSW.isOn{
        toppings.append("Onion")
        
        }
        if MushroomSW.isOn {
        toppings.append("Mushroom")
        // set the string in object and add todays date
            
            info.toppings = toppings
            
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            info.orderDate = dateFormatter.string(from: date)
            if info.breadType.isEmpty {
                info.breadType = "Regular Crust"}
            if info.breadType.isEmpty {
                info.cheeseType = "Parmesan"}
            if(info.breadType.isEmpty){
                info.sauceType = "BBQ"}
        
        }
        
       
        ordersList.orders.append(info)
        ordersList.save()
        Pizzeria_GlobalVariable.ordersList = ordersList
        // send the segue
        
//        performSegue(withIdentifier: "buildPizza", sender: info)
    }
   
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "buildPizza" {
//        let vc: OrdersTableViewController = segue.destination as! OrdersTableViewController
//
//           }
//}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        
        // add options for bread
        BreadRadiioButton.addButtons(radioButtonTitles:[ "Thick Crust", "Thin Crust", "Regular Crust"])
        BreadRadiioButton.delegate = self
        
        // add options for cheese
        
        CheeseRadioButton.addButtons(radioButtonTitles: ["No cheese","Mozzarella","Parmesan","Cheddar"])
        
    
        CheeseRadioButton.delegate = self
        
        // add options for Sauce
        
        SauceRadioButton.addButtons(radioButtonTitles: ["BBQ", "Creamy Garlic","Pesto" ,"Italian Tomato"])
        SauceRadioButton.delegate = self
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        
    

    

    
    func setValuesfromRadioClick(value:String){
        // set default values in case user doesnot choose any radio group
        
        
        if(value == "Thick crust" || value == "Thin Crust" || value == "Regular Crust")
        {
            info.breadType = value
        }
       
        else if(value == "No cheese" || value == "Mozzarella" || value == "Parmesan" || value == "Cheddar"){
            info.cheeseType = value
        }
    
        else if (value == "BBQ" || value == "Creamy Garlic" || value == "Pesto" || value == "Italian Tomato"){
            info.sauceType = value
        }
            
        }
    
}

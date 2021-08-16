//
//  BuildPizzaViewController.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-16.
//

import UIKit

class BuildPizzaViewController: UIViewController  {
    
    var ordersList : OrderList!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    

   //MARK: IB outlets
    
    @IBOutlet weak var BreadPicker: UIPickerView!
    @IBOutlet weak var CheesePicker: UIPickerView!
    @IBOutlet weak var SaucePicker: UIPickerView!
    
    @IBAction func orderButton(_ sender: Any) {
        
        ordersList.orders.append(getOrderData())
        ordersList.save()
    }
    
    var breadData:[String] = [String]()
    var cheeseData:[String] = [String]()
    var sauceData:[String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // connect the data to picker
//        self.BreadPicker.delegate = self
//        self.CheesePicker.delegate = self
//        self.SaucePicker.delegate = self
        
        /*
       
//
        */
        
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

        
//
//        // The number of rows of data
//        func breadPicker(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -&gt; Int {
//            return breadData.count
//        }
//
//        // The data to return fopr the row and component (column) that's being passed in
//        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -&gt; String? {
//            return pickerData[row]
//        }
    
     func addOrderToList(_info : OrderInfo){
        // add th emodel to list and call the save method.. 
        ordersList.orders.append(_info)
        ordersList.save()
    }
    
    func getOrderData() -> OrderInfo{

        // get the selected values from the view controller and send the selections
        let info = OrderInfo(coder: <#NSCoder#>);
        // add dummy data for now
        info?.breadType = "Thick crust"
        info?.cheeseType = "No cheese"
        info?.sauceType = "BBQ"
        info?.toppings = ["Chicken,Extra cheese"]
        
        return info!
    }
}

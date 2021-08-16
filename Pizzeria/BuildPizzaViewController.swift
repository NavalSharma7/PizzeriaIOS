//
//  BuildPizzaViewController.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-16.
//

import UIKit

class BuildPizzaViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource {
    
    

   //MARK: IB outlets
    
    @IBOutlet weak var BreadPicker: UIPickerView!
    @IBOutlet weak var CheesePicker: UIPickerView!
    @IBOutlet weak var SaucePicker: UIPickerView!
    
    var breadData:[String] = [String]()
    var cheeseData:[String] = [String]()
    var sauceData:[String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // connect the data to picker
        self.BreadPicker.delegate = self
        self.CheesePicker.delegate = self
        self.SaucePicker.delegate = self
        
        
       // get the bread , cheese and sauce  data
        breadData = DataModel.getBreads(<#T##self: DataModel##DataModel#>)()
        cheeseData = DataModel.getCheese(<#T##self: DataModel##DataModel#>)()
        sauceData = DataModel.getSauce(<#T##self: DataModel##DataModel#>)()
        
        
        
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

        // Number of columns of data
        func numberOfComponents(in pickerView: UIPickerView) -&gt; Int {
            return 1
        }
        
        // The number of rows of data
        func breadPicker(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -&gt; Int {
            return breadData.count
        }
        
        // The data to return fopr the row and component (column) that's being passed in
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -&gt; String? {
            return pickerData[row]
        }
}

//
//  RadioGroup.swift
//  Pizzeria
//
//  Created by Naval Sharma on 2021-08-17.
//

import Foundation

import Foundation
import UIKit
protocol RadioButtonGroupDelegate {
    func radioButtonClicked(button: RadioButton)
}
class RadioGroup {
    var delegate: RadioButtonGroupDelegate?
    var radioButtonsGroup = [String:[RadioButton]]()
        
    func appendToRadioGroup(radioButtons: [RadioButton]) {
        let totalGroups = radioButtonsGroup.keys.count
        let newGroupName = "group_\(totalGroups)"
        var buttonsInGroup = [RadioButton]()
        for button in radioButtons {
            button.addTarget(self, action: #selector(RadioGroup.updateButtons(button:)), for:UIControl.Event.touchUpInside)
            button.radioGroupName = newGroupName
            buttonsInGroup.append(button)
        }
        buttonsInGroup = Array(Set(buttonsInGroup))
        radioButtonsGroup[newGroupName] = buttonsInGroup
    }
    
    @objc func updateButtons(button:RadioButton) {
        if let radioGroup = radioButtonsGroup[button.radioGroupName] {
            for lbutton in radioGroup {
                if lbutton != button {
                    lbutton.isRadioSelected = false
                } else {
                    lbutton.isRadioSelected = true
                }
            }
        }
        delegate?.radioButtonClicked(button: button)
    }
    
    func removeButtons() {
        radioButtonsGroup.removeAll()
    }
    
    
}

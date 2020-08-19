//
//  logCoffeeBrewViewController.swift
//  Bean
//
//  Created by William Ho on 2020-08-18.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit

class LogCoffeeBrewViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var brewTypeTextField: UITextField!
    
    let brewTypePicker = UIPickerView()
    
    // Brew type options
//    let brewTypeOptions = [String](arrayLiteral: "Pour Over", "French Press", "Aeropress", "Other")
    let brewTypeOptions = ["Pour Over", "French Press", "Aeropress", "Other"]

    override func viewDidLoad() {
        super.viewDidLoad()
        brewTypeTextField.inputView = brewTypePicker
        brewTypePicker.delegate = self
    }
    
    // Shows the navigation bar
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
    }
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return brewTypeOptions.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return brewTypeOptions[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        brewTypeTextField.text = brewTypeOptions[row]
    }
    
}

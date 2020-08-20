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
    @IBOutlet var flavourProfileTextField: UITextField!
    @IBOutlet var flavourProfileTableView: UITableView!
    
    let brewTypePicker = UIPickerView()
    var flavours: [String] = []
    // Brew type options
    let brewTypeOptions = ["Pour Over", "French Press", "Aeropress", "Other"]

    override func viewDidLoad() {
        super.viewDidLoad()
        brewTypeTextField.inputView = brewTypePicker
        brewTypePicker.delegate = self
        flavourProfileTableView.tableFooterView = UIView(frame: CGRect.zero)
        flavourProfileTableView.delegate = self
      
    }
    
    // Shows the navigation bar
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
    }
   
    @IBAction func addButtonPressed(_ sender: Any) {
        insertNewFlavour()
    }
    

    
    //MARK: - PickerView for Brew Type
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
    
    //MARK: - TableView
    
    func insertNewFlavour() {
        
        flavours.append(flavourProfileTextField.text!)

        let indexPath = IndexPath(row: flavours.count - 1, section: 0)

        flavourProfileTableView.beginUpdates()
        flavourProfileTableView.insertRows(at: [indexPath], with: .automatic)
        flavourProfileTableView.endUpdates()

        flavourProfileTextField.text = ""
        view.endEditing(true)
        
    }
}

extension LogCoffeeBrewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flavours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let flavourValue = flavours[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlavourCell", for: indexPath)
        cell.textLabel?.text = flavourValue

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            flavours.remove(at: indexPath.row)
            
            flavourProfileTableView.beginUpdates()
            flavourProfileTableView.deleteRows(at: [indexPath], with: .automatic)
            flavourProfileTableView.endUpdates()
        }
    }

    
}

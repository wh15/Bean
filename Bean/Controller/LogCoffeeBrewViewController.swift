//
//  logCoffeeBrewViewController.swift
//  Bean
//
//  Created by William Ho on 2020-08-18.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit
import Firebase

class LogCoffeeBrewViewController: UIViewController {

    @IBOutlet var brewTypeTextField: UITextField!
    @IBOutlet var beanSupplierTextField: UITextField!
    @IBOutlet var beanNameTextField: UITextField!
    @IBOutlet var beanWeightTextField: UITextField!
    @IBOutlet var grindSizeTextField: UITextField!
    @IBOutlet var waterTemperatureTextField: UITextField!
    @IBOutlet var flavourProfileTextField: UITextField!
    @IBOutlet var flavourProfileTableView: UITableView!
    
    let db = Firestore.firestore()
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
    
    // When user presses this button, it will add the text in the textfield to the tableview
    @IBAction func addButtonPressed(_ sender: Any) {
        insertNewFlavour()
    }
    
    // Function to add text to tableview
    func insertNewFlavour() {
        
        flavours.append(flavourProfileTextField.text!)
        
        let indexPath = IndexPath(row: flavours.count - 1, section: 0)
        
        flavourProfileTableView.beginUpdates()
        flavourProfileTableView.insertRows(at: [indexPath], with: .automatic)
        flavourProfileTableView.endUpdates()
        
        // Resets textfield to empty string
        flavourProfileTextField.text = ""
        view.endEditing(true)
    }
    
    @IBAction func logPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Successful", message: "Added to your profile.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {
            action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        if let userAccount = Auth.auth().currentUser?.email, let brewType = brewTypeTextField.text, let beanSupplier = beanSupplierTextField.text, let beanName = beanNameTextField.text, let beanWeight = beanWeightTextField.text, let grindSize = grindSizeTextField.text, let waterTemperature = waterTemperatureTextField.text {
            db.collection(K.Collection.logCoffeeBrew).addDocument(data: [K.FStore.userEmail: userAccount,
                                                                         K.LogCoffeeBrew.brewType: brewType,
                                                                         K.LogCoffeeBrew.beanSupplier: beanSupplier,
                                                                         K.LogCoffeeBrew.beanName: beanName,
                                                                         K.LogCoffeeBrew.beanWeight: beanWeight,
                                                                         K.LogCoffeeBrew.grindSize: grindSize,
                                                                         K.LogCoffeeBrew.waterTemperature: waterTemperature,
                                                                         K.LogCoffeeBrew.flavourProfile: flavours])
            self.present(alert, animated: true)
        }
    }
}
    
//MARK: - PickerView for Brew Type

// When user selects Brew Type TextField, a picker view will show up, showcasing various options for the user to select
extension LogCoffeeBrewViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
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
    
//MARK: - TableView

// Allows users to add and delete text in UITableView

extension LogCoffeeBrewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flavours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let flavourValue = flavours[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlavourCell", for: indexPath)
        cell.textLabel?.text = flavourValue
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
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

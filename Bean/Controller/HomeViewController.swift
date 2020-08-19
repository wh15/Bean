//
//  HomeViewController.swift
//  Coffee Log
//
//  Created by William Ho on 2020-08-17.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var checkInCafeButton: UIButton!
    @IBOutlet var logCoffeeBrewButton: UIButton!
    @IBOutlet var logEspressoButton: UIButton!
    @IBOutlet var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rounded corner edges for buttons
        checkInCafeButton.layer.cornerRadius = 5
        checkInCafeButton.layer.borderWidth = 1
        logCoffeeBrewButton.layer.cornerRadius = 5
        logCoffeeBrewButton.layer.borderWidth =  1
        logEspressoButton.layer.cornerRadius = 5
        logEspressoButton.layer.borderWidth = 1
        profileButton.layer.cornerRadius = 5
        profileButton.layer.borderWidth = 1
    }
    
    // Hides the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = true
    }
    
    @IBAction func logCoffeeBrewPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeToLogCoffeeBrew", sender: self)
    }
    

}

//
//  logCoffeeBrewViewController.swift
//  Bean
//
//  Created by William Ho on 2020-08-18.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit

class LogCoffeeBrewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Shows the navigation bar
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
    }


}

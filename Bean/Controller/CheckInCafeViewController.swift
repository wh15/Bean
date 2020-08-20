//
//  CheckInCafeViewController.swift
//  Bean
//
//  Created by William Ho on 2020-08-20.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit

class CheckInCafeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Shows the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
    }

    @IBAction func locationPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "CheckInCafeToMaps", sender: self)
    }
    
}


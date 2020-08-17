//
//  ViewController.swift
//  Coffee Log
//
//  Created by William Ho on 2020-07-16.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = true
    }


}


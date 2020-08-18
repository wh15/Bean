//
//  ViewController.swift
//  Coffee Log
//
//  Created by William Ho on 2020-07-16.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // If user has previously logged in/registered, log them in automatically and show them the home view
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "WelcomeToHome", sender: self)
        }
    }
    
    // Hides the navigation bar 
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = true
    }


}


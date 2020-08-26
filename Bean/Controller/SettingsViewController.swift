//
//  SettingsViewController.swift
//  Bean
//
//  Created by William Ho on 2020-08-18.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Shows the navigation bar
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
            print("success")
        } catch let signOutError as NSError {
            print("Error Signing Out.")
        }
       }

}

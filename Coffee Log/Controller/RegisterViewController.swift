//
//  RegisterViewController.swift
//  Coffee Log
//
//  Created by William Ho on 2020-08-17.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
    }


     @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email  = emailTextField.text, let password = passwordTextField.text {
            if (passwordTextField.text!.count >= 6) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.errorLabel.text = "Error with registration. Please try again."
            } else {
                print("success")
                // Navigating to the HomeViewController
                self.performSegue(withIdentifier: "RegisterToHome", sender: self)
            }
            }
            } else {
                self.errorLabel.text = "Password must be at least 6 characters."
            }
    }
    }

}

//
//  LoginViewController.swift
//  Bean
//
//  Created by William Ho on 2020-08-18.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Shows the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
    }
    
    // Shows error message if invalid login
    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) {  (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                } else {
                    self.errorLabel.text = "Please enter a valid email and password."
                }
            }
        }
    }
}

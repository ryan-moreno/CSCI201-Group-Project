//
//  LoginViewController.swift
//  USCMessagesApp
//
//  Created by Michelle Huntley on 3/29/18.
//  Copyright © 2018 CSCI 201. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginBackButton", sender: self)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userNameField.delegate = self
        passwordField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func enterTapped(_ sender: Any) {
        let username = userNameField.text!
        let password = passwordField.text!
        
    }
}

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

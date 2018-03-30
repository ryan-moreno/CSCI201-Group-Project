//
//  LoginViewController.swift
//  USCMessagesApp
//
//  Created by Michelle Huntley on 3/29/18.
//  Copyright © 2018 CSCI 201. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginBackButton", sender: self)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

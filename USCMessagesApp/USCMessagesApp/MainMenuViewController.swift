//
//  ViewController.swift
//  USCMessagesApp
//
//  Created by Michelle Huntley on 3/23/18.
//  Copyright © 2018 CSCI 201. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("Button 1 pressed")
        self.performSegue(withIdentifier: "LoginSegue", sender: self)
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        print("Button 2 pressed")
        self.performSegue(withIdentifier: "SignupSegue", sender: self)
    }
    
    @IBAction func guestButtonPressed(_ sender: UIButton) {
        print("Button 3 pressed")
        self.performSegue(withIdentifier: "GuestSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("View has loaded")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


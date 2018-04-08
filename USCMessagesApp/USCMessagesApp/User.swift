//
//  User.swift
//  USCMessagesApp
//
//  Created by Michelle Huntley on 4/8/18.
//  Copyright © 2018 CSCI 201. All rights reserved.
//

import Foundation

class User {
    var username: String
    var password: String
    
    
    init() {
        self.username = ""
        self.password = ""
    }
    
    func setUsername (un: String) {
        self.username = un
    }
    
    func setPassword (pw: String) {
        self.password = pw;
    }
    
    //returns username
    func getUsername () -> String {
        return username
    }
    
    //returns password
    func getPassword () -> String {
        return password
    }
}

//
//  Message.swift
//  USCMessagesApp
//
//  Created by Michelle Huntley on 4/8/18.
//  Copyright © 2018 CSCI 201. All rights reserved.
//

import Foundation

class Message {
    var id: Int
    var pictureMessage: String
    var audioMessage: String
    var textMessage: String
    var flaggedCount: Int
    var timestamp: Date
    var latitude: Double
    var longitude: Double
    
    
    init() {
        self.id = 0
        self.pictureMessage = ""
        self.audioMessage = ""
        self.textMessage = ""
        self.flaggedCount = 0
        self.timestamp = Date()
        self.latitude = 0.0
        self.longitude = 0.0
    }
    
    func setID(id: Int) {
        self.id = id
    }
    
    func setImage(picture: String) {
        self.pictureMessage = picture
    }
    
    func setAudio(audio: String) {
        self.audioMessage = audio
    }
    
    func setText(text: String) {
        self.textMessage = text
    }
    
    func setFlaggedCount(flagged: Int) {
        self.flaggedCount = flagged
    }
    
    func setTimestamp(time: Date) {
        self.timestamp = time
    }
    
    func setLatitude(lat: Double) {
        self.latitude = lat
    }
    
    func setLongitude(long: Double) {
        self.longitude = long
    }
    
    func getID() -> Int {
        return id
    }
    
    func getImage() -> String {
        return pictureMessage
    }
    
    func getAudio() -> String {
        return audioMessage
    }
    
    func getText() -> String {
        return textMessage
    }
    
    func getFlaggedCount() -> Int {
        return flaggedCount
    }
    
    func getTimestamp() -> Date {
        return timestamp
    }
    
    func getLatitude() -> Double {
        return latitude
    }
    
    func getLongitude() -> Double {
        return longitude
    }
    
}

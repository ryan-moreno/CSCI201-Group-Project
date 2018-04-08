//Reference database as db elsewhere AppRef
import Firebase


class DatabaseInteract {
    var db: Firestore!
    
    func getMsgId() -> Int {
        let docRef = db.collection("message").document("msgid")
        var id = Int()
        docRef.getDocument { (docSnapShot, error) in
            guard let docSnapshot = docSnapShot, docSnapshot.exists else {return }
            let myData = docSnapshot.data()
            id = myData?["msgid"] as? Int ?? 0
            
        }
        return id
    }

    func nextMsgId() {
        //proceed to next message id once new msg is added

        db.collection("id").document("msgid").setData([
            "id": getMsgId()+1
        ]) { err in
            if let err = err {  
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }

    
    func addUser(user: User){
        //Add a new document named username into user
        
        db.collection("user").document(user.username).setData([
            "username": user.username,
            "password": user.password,
            "userid": 1
        ]) { err in
            if let err = err {  
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }

    func queryUser (username: String) -> User {
        //returns User object that has same username
        let docRef = db.collection("user").document(username)
        let user = User()

        docRef.getDocument { (docSnapShot, error) in
            guard let docSnapshot = docSnapShot, docSnapshot.exists else {return }
            let myData = docSnapshot.data()
            let username = myData?["username"] as? String ?? ""
            let password = myData?["password"] as? String ?? ""
            user.setUsername(un: username)
            user.setPassword(pw: password)
        }
        return user
    }

    func addMessage (msg: Message){
        //Add a new document named message id into message collection
        db.collection("message").document(String(msg.getID())).setData([
            "id": getMsgId()+1,
            "textMessage": msg.textMessage,
            "audioMessage": msg.audioMessage,
            "pictureMessage": msg.pictureMessage,
            "latitude": msg.latitude,
            "longitude": msg.longitude,
            "timestamp": msg.timestamp,
            "flaggedCount": 0
        ]) { err in
            if let err = err {  
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                self.nextMsgId();
            }
        }

    }
    
    func queryMessage (msgid: Int) -> Message {
        //returns Message object w msgid
        let docRef = db.collection("message").document("msgid")
        let message = Message()
        
        docRef.getDocument { (docSnapShot, error) in
            guard let docSnapshot = docSnapShot, docSnapshot.exists else {return }
            let myData = docSnapshot.data()
            let id = myData?["id"] as? Int ?? 0
            let pictureMessage = myData?["pictureMessage"] as? String ?? ""
            let audioMessage = myData?["audioMessage"] as? String ?? ""
            let textMessage = myData?["textMessage"] as? String ?? ""
            let flaggedCount = myData?["flaggedCount"] as? Int ?? 0
            let timestamp = myData?["timestamp"] as? Date ?? Date()
            let latitude = myData?["latitude"] as? Double ?? 0.0
            let longitude = myData?["longitude"] as? Double ?? 0.0
    
            message.setID(id: id)
            message.setImage(picture: pictureMessage)
            message.setAudio(audio: audioMessage)
            message.setText(text: textMessage)
            message.setFlaggedCount(flagged: flaggedCount)
            message.setTimestamp(time: timestamp)
            message.setLatitude(lat: latitude)
            message.setLongitude(long: longitude)
        }
        return message
    }

    func deleteMessage (msgid: Int){
        db.collection("message").document("msgid").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
/*
    func getUsers() -> String{
        //return entire user collection
        db.collection("user").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                return document.date()
            }
        }
    }

    func getMessages() {
        //return entire message collection
        db.collection("message").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                return document.date()
            }
        }
    }
     */

}

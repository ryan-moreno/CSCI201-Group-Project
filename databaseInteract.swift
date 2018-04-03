import FirebaseFirestore

//Referecne database as db elsewhere AppRef

class DatabaseInteract {
    
    func getMsgId() {
        let docRef = db.collection("message").document(msgid)

        docRef.getDocument { (document, error) in
            if let document = document {   
                print("Document data: \(document.data())")
                return document.data()
            } else {
                print("Document does not exist")
            }
        }
    }

    func nextMsgId() {
        //proceed to next message id once new msg is added
        let docRef = db.collection("message").document(msgid)

        db.collection("id").document(msgid).setData([
            "id": getMsgId()+1
        ]) { err in
            if let err = err {  
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                nextMsgId();
            }
        }
    }

    
    func addUser(user){
        //Add a new document named username into user
        db.collection("user").document(user.username).setData([
            "username": user.username,
            "password": user.password,
            "userid": uid+1
        ]) { err in
            if let err = err {  
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }

    func queryUser (username){
        //returns User object that has same username
        let docRef = db.collection("user").document(username)

        docRef.getDocument { (document, error) in
            if let user = document.flatMap({
            $0.data().flatMap({ (data) in
                return User(dictionary: data)
            })
            }) {
                print("User: \(user)")
            } else {
                print("Document does not exist")
            }
        }

        /*
        let docRef = db.collection("user").document(username)

        docRef.getDocument { (document, error) in
            if let document = document {
                return document.data()
                print("Document data: \(document.data())")
            } else {
                print("Document does not exist")
            }
        }
        */
    }

    func addMessage (msg){
        //Add a new document named message id into message collection
        db.collection("message").document(mid).setData([
            "id": getMsgId()+1,
            "textMessage": msg.textMessage,
            "audioMessage": msg.audioMessage,
            "pictureMessage": msg.pictureMessage,
            "locationx": msg.locationx,
            "locationy": msg.locationy,
            "timestamp": msg.timestamp,
            "flaggedCount": 0
        ]) { err in
            if let err = err {  
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                nextMsgId();
            }
        }

    }

    func queryMessage (msgid){
        //return Message object w the same msgid
        let docRef = db.collection("message").document(msgid)

        docRef.getDocument { (document, error) in
            if let message = document.flatMap({
            $0.data().flatMap({ (data) in
                return Message(dictionary: data)
            })
            }) {
                print("Message: \(message)")
            } else {
                print("Document does not exist")
            }
        }
    }

    func deleteMessage (msgid) {
        db.collection("message").document(msgid).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }

    func getUsers(){
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

}

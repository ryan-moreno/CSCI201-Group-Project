func storeMessage(message: Message) {

    let id = message.getID()
    let textMessage = message.getText()
    let audioMessage = message.getAudio()
    let pictureMessage = message.getImge()
    let latitude = message.getLatitude()
    let longitude = message.getLongitude()
    let timestamp = message.getTimestamp()

    let json = ["id":id, "textMessage": textMessage, "audioMessage": audioMessage, "pictureMessage": pictureMessage, "latitude": latitude, "longitude": longitude, "timestamp": timestamp]

    do {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
        let url = NSURL(string: "http://127.0.0.1:8080/MessageServlet")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = jsonData
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
              //check for errors
              guard let data = data, error == nil else {
                  print("error=\(String(describing: error))")
                  return
              }

              if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                  print("statusCode should be 200, but is \(httpStatus.statusCode)")
                  print("response = \(String(describing: response))")
              }
            
        }
        task.resume()
    } catch {
        print(error)
    }
    
}


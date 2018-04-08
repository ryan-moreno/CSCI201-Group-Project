//this class allows the application to know who is logged in
Class LoginSession {
  var isLogin:Bool = false
  var username:String = ""

  static let shareInstance = LoginSession()

  init() {}
}

//this function will return 1 for a successful login, 0 for a valid username
//but no matching password and -1 for invalid username

func validateLogin(String username, String password) -> int {
    let json = ["username":username,"password":password,"login":true]

    do {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
        let url = NSURL(string: "http://127.0.0.1:5000/DatabaseServlet")!
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

              if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                let success = jsonObj!.value(forKey: "success")
                let usernameExists = jsonObj!.value(forKey: "usernameExists")
                if success {
                  //set the user as logged in
                  LoginInfo.shareInstance.isLogin = true
                  LoginInfo.shareInstance.username = username
                  return 1
                } else if usernameExists {
                  return 0
                } else {
                  return -1
                }
              }

        }
        task.resume()
    } catch {
        print(error)
    }
}

//this function will return 1 for a successful signup, 0 if not

func validateSignUp(String username, String password) -> int {
    let json = ["username":username,"password":password,"login":false]

    do {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
        let url = NSURL(string: "http://127.0.0.1:5000/DatabaseServlet")!
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

              if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                let success = jsonObj!.value(forKey: "success")
                let usernameExists = jsonObj!.value(forKey: "usernameExists")
                if success {
                  LoginInfo.shareInstance.isLogin = true
                  LoginInfo.shareInstance.username = username
                  return 1
                } else {
                  return 0
                }
              }

        }
        task.resume()
    } catch {
        print(error)
    }
}

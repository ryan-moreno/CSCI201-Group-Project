func loginServlet (user: User) {
    let username = user.getUsername()
    let password = user.getPassword()
    let json: [String: Any] = ["username":username,"password":password]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    let url = URL(string: "http://10.123.71.138:8080/DatabaseServlets/LogInServlet")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    // insert json data to the request
    request.httpBody = jsonData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON as? [String: Any] {
            print(responseJSON)
        }
    }

    task.resume()
}

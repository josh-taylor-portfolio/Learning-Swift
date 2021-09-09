# iOS Networking

Overview

1. URLSession is used to create a URLSessionTask and can be used to make subsequest requests using URLSessionTask. Task is always apart of a session
2. URLSessionTaks
    - can fetch and return data to your app, and download and upload files to webservices.
3. URLSessionConfiguration
    - use this to configure a session to manage caching, cookies, connectivity and credentials
4. URLSessionDataTask
    - a data task that is given a url and has completion block that has the response


URLSession different Tasks:
1. Data tasks
    - send and receive data with URLSessionDataTaskby using NSData objects. Common for JSON
3. Upload tasks
    - send files to a webserver with URLSessionUploadTask. 
    - They’re similar to data tasks, but URLSessionUploadTask instances can also upload data in the background (or when an app is suspended)
5. Download tasks
    - download files from a webserver with URLSessionDownloadTask by directly writing to a temporary file
    - You can track the progress of file downloads, and pause and resume them


# Fetching Data With URLSession
1. Set up the HTTP request with URLSession
2. Make the request with URLSessionDataTask
3. Properly validate the response data
4. Convert the response data to JSON

### 1. Set up the HTTP request with URLSession

```swift
let url = URLSession.shared.URL(string: "...")!
```

- URL is is an optional being forcred unwrapped.
- The URLSession.shared singleton is a reference to a shared URLSession instance that has no configuration. 

### 2. Make the request with URLSessionDataTask

```swift
let task = session.dataTask(with: url, completionHandler: { data, response, error in

    // Do something...
})
```
- the response Data object, a URLResponse reponse, and an Error error. All of these closure parameters are optionals, so they can be nil
- let task is the return value of dataTask
- url is the you want to connect to and download data e.g. json from "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs?number=1"
- completionHandler excutes after the request has finished and passes in the data, repsonse, and error
    - data object, of type Data, to check out what data we got back from the webserver, such as the JSON we’ve requested
    - response object, of type URLResponse, can tell us more about the request’s response, such as its length, encoding, HTTP status code, return header fields, etc
    - error object contains an Error object if an error occurred while making the request. When no error occurred, it’s simply nil

Finally:
```swift
task.resume()
```
- By calling the resume() function on the task object, the request is executed and the completion handler is invoked at some point. It’s easy to forget calling resume(), so make sure you don’t!

# 3. Properly validate the response data

1. Check if the Status code in the reponse is what you're expecting
2. Check if error is NOT nil

# 4. Convert to JSON
```
let jsonString = """
{
    "first_name": "John",
    "last_name":  "Doe",
    "country":    "United Kingdom"
}
"""

struct User: Codable {
    var first_name: String
    var last_name: String
    var country: String
}

let jsonData = jsonString.data(using: .utf8)!
let user = try! JSONDecoder().decode(User.self, from: jsonData)
print(user.last_name)
// Output: Doe
```

This uses Codeable to decode the json. The fields of the struct match the fields of the jsonString. 

# Making POST Requests With URLSession

1. Set up the HTTP POST request with URLSession
2. Set up the request headers and body
3. Make the request with URLSessionUploadTask

### Set up the HTTP POST request with URLSession

Making POST requests with URLSession mostly comes down to configuring the request.

```swift
let session = URLSession.shared
let url = URL(string: "https://example.com/post")!

var request = URLRequest(url: url)
request.httpMethod = "POST"
```

- request.httpMethod sets the httpMethod type (Get, Post, Delete, ...)

### Set up the request headers and body

- A header is a special parameter that’s sent as part of the request, and it typically contains special information for the webserver or the web application. A good example is the Cookie header, that’s used to send cookie information back and forth.

```swift
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
```

- You can use codable to encode an object to JSON and add it to the post request

```swift 
struct User: Codable {
    var first_name: String
    var last_name: String
}

let jsonData = try! JSONEncoder().encode(user)
```

### Make the request with URLSessionUploadTask

```swift
let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
    // Do something...
}

task.resume()
```

To see the response code:
```swift
if let httpResponse = response as? HTTPURLResponse {
    print(httpResponse.statusCode)
}
```

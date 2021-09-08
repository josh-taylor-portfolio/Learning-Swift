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
3. Quickly print the returned response data
4. Properly validate the response data
5. Convert the response data to JSON

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


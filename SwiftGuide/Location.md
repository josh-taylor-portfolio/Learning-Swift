# User Location

### Request Location Permissions

Two type's of authorization
1. Always
2. When in Use

Some CLLocation Properties:
1. coordinate(Long, Lat)
2. altitude
3. course

Modify "Location When In Use Usage Description" or "Location When In Use Usage Description" in the plist file before requesting user location permissions. 

Then request authorization:
```swift
import CoreLocation

// Create a CLLocationManager and assign a delegate
let locationManager = CLLocationManager()
locationManager.delegate = self

//Always
// Use requestAlwaysAuthorization if you need location 
// updates even when your app is running in the background
locationManager.requestAlwaysAuthorization()

//--------------------------------------------------------

import CoreLocation

// Create a CLLocationManager and assign a delegate
let locationManager = CLLocationManager()
locationManager.delegate = self

//When in Use
// Use requestWhenInUseAuthorization if you only need
// location updates when the user is using your app
locationManager.requestWhenInUseAuthorization()
```

### Check Location Permissions Using CLLocationManager

CLLocationManager.authorizationStatus() returns current location permission authorization
```swift
// Get the current location permissions
let status = CLLocationManager.authorizationStatus()

// Handle each case of location permissions
switch status {
    case .authorizedAlways:
        // Handle case
    case .authorizedWhenInUse:
        // Handle case
    case .denied:
        // Handle case
    case .notDetermined:
        // Handle case
    case .restricted:
        // Handle case
}
```

If permissions change locationManagerDidChangeAuthorization will be called and can be updated
```swift
func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {}
```

### Getting One Off Locations
```swift 
import CoreLocation

// Create a CLLocationManager and assign a delegate
let locationManager = CLLocationManager()
locationManager.delegate = self

// Request a user’s location once
locationManager.requestLocation()
```

locationManager.requestLocation() calls the delegate method locationManager(:, didUpdateLocations:)

```swift
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        // Handle location update
    }
}
```

If the location request fails for any reason this is called instead of locationManager(:, didUpdateLocations:)
```swift
    func locationManager(
            _ manager: CLLocationManager,
            didFailWithError error: Error
        ) {
            // Handle failure to get a user’s location
            //show alert
        }
 ```
 
 ### Get Real-Time User Location Updates
 
 ```swift
 import CoreLocation

// Create a CLLocationManager and assign a delegate
let locationManager = CLLocationManager()
locationManager.delegate = self

// Start updating location
locationManager.startUpdatingLocation()

// Make sure to stop updating location when your
// app no longer needs location updates
locationManager.stopUpdatingLocation()


func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { {
    if let location = locations.last {
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        // Handle location update
    }
}
```




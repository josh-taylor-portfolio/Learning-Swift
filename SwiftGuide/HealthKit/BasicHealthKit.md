# HealtKit Overvivew

#### Setting up Healthkit

1. Enable Healthkit in the in the Capabilities in the project
2. Check to see if HealthKit is available for the device. Requires iOS 8+  and is compatabile with iPad
```swift
if HKHealthStore.isHealthDataAvailable() {
    // Add code to use HealthKit here.
}
```
3. Create a HealthKit store. Apple tells us that we only need one health store per app, and that the objects are long-lived. All we need to do is create the health store and then keep a reference to it.
```swift
let healthStore = HKHealthStore()
```
4. Request user permission to access data, by telling the user what data we are interested in reading and writing to 
```swift 
func requestAuthorization(toShare typesToShare: Set<HKSampleType>?, 
                             read  typesToRead: Set<HKObjectType>?, 
                                    completion: @escaping (Bool, Error?) -> Void) 
```
1. typesToShare: A set containing the data types you want to share.  If the user grants permission, your app can create and save these data types to the HealthKit store. (aka read/write)
2. typesToRead:  A set containing the data types you want to read. If the user grants permission, your app can read these data types from the HealthKit store. (aka read only)
3. completion: A block called after the user finishes responding to the request. The system calls this block with the following parameters:
    - success: a Boolean value that indicates whether the request succeeded. Does not indicate whether user actaully granted permission. false if error occurred while processing the request; otherwise true
    - error: if an error occurred, this object contains information about the error; otherwise, it’s set to nil.

Discussion from Apple's website about requestAuthorization:
- performs these requests asynchronously
- the system will automatically display a permission form for any new data type. If the user has already chosen to grant or prohibit access to all of the types specified, HealthKit calls the completion without prompting the user.
- Each data type has two separate permissions, one to read it and one to share it. You can make a single request, and include all the data types your app needs.
- NSHealthShareUsageDescription and NSHealthUpdateUsageDescription keys in info.plist to customize the messages displayed on the permissions sheet

# HKObjectType

#### An abstract superclass with subclasses that identify a specific type of data for the HealthKit store.

```swift
class HKObjectType : NSObject
```
HealthKit object types aren’t extensible and don't subclass  

Concrete classes of HKObjectType:
- HKActivitySummaryType
- HKCategoryType
- HKCorrelationType
- HKCharacteristicType
- HKDocumentType
- HKQuantityType
- HKSeriesType
- HKWorkoutType

```swift
/// creates a set of HKObjectType to request read access
let readDataTypes : Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!]
```

# HKQuantityTypeIdentifier

#### Used to define the identifiers that create quantity type objects

```swift
struct HKQuantityTypeIdentifier
```

- To create an HKQuantityType instance, pass an HKQuantityTypeIdentifier value to the quantityType(forIdentifier:) method.
- if we wanted to access the users weight, we would use the following:
```swift
HKQuantityTypeIdentifier.bodyMass
```

# CharachteristicTypes


```swift
let readDataTypes : Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
                       HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!]
We then need to request authorisation and pass in the set as follows:

healthStore.requestAuthorization(toShare: nil, read: readDataTypes) { (success, error) in
    if !success {
        // Handle the error here.
    } else {
        print("We're good")
    }
}
```

# Writing Data

If we wanted to write data, we would need to create a Set for toShare. 
```swift
let writeDataTypes : Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!]

healthStore.requestAuthorization(toShare: writeDataTypes, read: readDataTypes) { (success, error) in...
```

# Example

* not showing full ViewController code
```swift
let healthStore = HKHealthStore()

override func viewDidLoad() {
    super.viewDidLoad()
    
    // Check if HealthKit is available on this device
    if HKHealthStore.isHealthDataAvailable() {
        //Create readDataTypes set that will be passed to requestAuthorization
        let readDataTypes : Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
                               HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!]
        
         //Create writeDataTypes set that will be passed to requestAuthorization
        let writeDataTypes : Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!]
        
        //request authorization to read steopCount and biologicalSex and write stepCount
        healthStore.requestAuthorization(toShare: writeDataTypes, read: readDataTypes) { (success, error) in
            if !success {
                // Handle the error here.
            } else {
                // Do the work
            }
        }
    }
    
}

permission form:
![permissionForm](https://user-images.githubusercontent.com/89819167/132058704-85806e31-eb87-4f55-9cf1-efca980da5eb.png)

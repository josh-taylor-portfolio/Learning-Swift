# Reading from HealthKit

-  reading characteristic data
-  queries
-  long-running queries

### Reading Characteristic Data

Do not require a query to be made. This is because these values do not change. e.g Date of Birth. 

```swift
if try! healthStore.biologicalSex().biologicalSex == HKBiologicalSex.female {
    print("You are female")
} else if try! healthStore.biologicalSex().biologicalSex == HKBiologicalSex.male {
    print("You are male")
} else if try! healthStore.biologicalSex().biologicalSex == HKBiologicalSex.other {
    print("You are not categorised as male or female")
}
```

- One thing to always make sure is that if you are requesting a characteristic that you have requested authorisation from the user to access this information.
- If you have NOT asked for permission to acess healthStore.biologicalSex() an excpetion will be thrown
- If none of the conditions are true nothing will happen

From Apples Documentations:
```
To help protect the user’s privacy, your app does not know 
whether the user granted or denied permission to read data 
from HealthKit. If the user denied permission, attempts 
to query data from HealthKit return only samples that your 
app successfully saved to the HealthKit store.
```

Possible Reason No data can be read:
- You did not ask the user for permission.
- The user declined giving permission.

```swift
let healthStore = HKHealthStore()

if HKHealthStore.isHealthDataAvailable() {
        let readDataTypes : Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
                                   HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!]
        
        let writeDataTypes : Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!]
        
        healthStore.requestAuthorization(toShare: writeDataTypes, read: readDataTypes) { (success, error) in
            if !success {
                // Handle the error here.
            } else {
                self.testCharachteristic()
            }
        }
    }
    
}

/// Fetches biologicalSex of the user.
func testCharachteristic() {
    if try! healthStore.biologicalSex().biologicalSex == HKBiologicalSex.female {
        print("You are female")
    } else if try! healthStore.biologicalSex().biologicalSex == HKBiologicalSex.male {
        print("You are male")
    } else if try! healthStore.biologicalSex().biologicalSex == HKBiologicalSex.other {
        print("You are not categorised as male or female")
    }
}
```

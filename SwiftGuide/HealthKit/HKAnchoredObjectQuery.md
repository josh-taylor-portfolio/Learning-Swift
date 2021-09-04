# HKAnchoredObjectQuery

- HKAnchoredObjectQuery provides a useful way to keep tabs on what has changed for a particular sample type.
- Provides us with both the ability to receive a snapshot of data, and then on subsequent calls, a snapshot of what has changed.
- Alternatively you can create the initial snapshot of samples, and then continuously monitor as a long-running query which notifies you each time a new sample is added or when a sample is deleted.

init(type:predicate:anchor:limit:resultsHandler:)

```swift
1. init(type: HKSampleType, 
2. predicate: NSPredicate?, 
3. anchor: HKQueryAnchor?, 
4. limit: Int, 
5. resultsHandler handler: @escaping (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void)
```

1. type: The type of sample to search for. 
2. predicate: A predicate that filters both the samples and the deleted objects returned by the query. Pass nil to receive all the newly added samples and recently deleted objects of the specified type.
3. anchor: he anchor returned by the previous anchored object query. The anchor object corresponds to the last object that was returned by the previous anchored object query. The new query returns only samples and deleted objects that are newer than that object. Pass nil to receive all the matching samples and recently deleted objects currently in the HealthKit store.
4. limit: The maximum number of samples received by the query. To receive all of the new samples, pass HKObjectQueryNoLimit.
5. resultsHandler: A block that the system calls after gathering the initial results. 
    - query: A reference to the query calling this block.
    - sampleObjects: An array containing the samples returned by this query, or nil if an error occurred.
    - deletedObjects: An array containing the deleted objects returned by this query, or nil if an error occurred.
    - newAnchor: An anchor object corresponding to the last object returned by this query. Subsequent anchor queries use this value to receive new samples and deleted objects created after the query returned its initial results.
    - error: If an error occurs, this parameter contains an object describing the error; otherwise, it is nil.

# HKQueryAnchor
- cant be sorted.
- you are notified of additions or deletions to the sample type.
- If this is the first query your app is making, then you can just pass in nil here. This will request all data. When all data is retrieved, a new anchor is provided which is used automatically when the app is running, or alternatively, you can persist the anchor and use it for the next time you open the app.
- From Apple Documentation: “the anchor object corresponds to the last object that was returned by the previous anchored object query”

Building a HKAnchoredObjectQuery:  
``` swift
    let bodyMassType = HKObjectType.quantityType(forIdentifier: .bodyMass)
    
    // Create the query.
    let query = HKAnchoredObjectQuery(type: bodyMassType,
                                      predicate: nil,
                                      anchor: nil,
                                      limit: HKObjectQueryNoLimit() { (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in
                                        guard let samples = samplesOrNil, let deletedObjects = deletedObjectsOrNil else {
                                            fatalError("*** An error occurred during the initial query: \(errorOrNil!.localizedDescription) ***")
                                        }
        
                                        for bodyMassSample in samples {
                                            print("Samples: \(bodyMassSample)")
                                        }
        
                                        for deletedBodyMassSample in deletedObjects {
                                            print("deleted: \(deletedBodyMassSample)")
                                        }
    }
    healthStore.execute(query)
}
```
anchor is nil so it is similiar to a HKSampleQuery.  
You want to keep track of the Anchor because it is not persisted. This can be done  with UserDefaults.
```swift
guard let bodyMassType = HKObjectType.quantityType(forIdentifier: .bodyMass) else {
        fatalError("*** Unable to get the body mass type ***")
    }
    
    var anchor = HKQueryAnchor.init(fromValue: 0)
    
    if UserDefaults.standard.object(forKey: "Anchor") != nil {
        let data = UserDefaults.standard.object(forKey: "Anchor") as! Data
        anchor = NSKeyedUnarchiver.unarchiveObject(with: data) as! HKQueryAnchor
    }
    
    let query = HKAnchoredObjectQuery(type: bodyMassType,
                                      predicate: nil,
                                      anchor: anchor,
                                      limit: HKObjectQueryNoLimit) { (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in
                                        guard let samples = samplesOrNil, let deletedObjects = deletedObjectsOrNil else {
                                            fatalError("*** An error occurred during the initial query: \(errorOrNil!.localizedDescription) ***")
                                        }
                                        
                                        anchor = newAnchor!
                                        let data : Data = NSKeyedArchiver.archivedData(withRootObject: newAnchor as Any)
                                        UserDefaults.standard.set(data, forKey: "Anchor")
        
                                        for bodyMassSample in samples {
                                            print("Samples: \(bodyMassSample)")
                                        }
        
                                        for deletedBodyMassSample in deletedObjects {
                                            print("deleted: \(deletedBodyMassSample)")
                                        }
                                        
                                        print("Anchor: \(anchor)")
    }
    healthStore.execute(query)
```

# HKAnchoredObjectQuery updateHandler
- When a change is made in Health to body Mass (or whatever type of sample you are running the query on), you will be immediately notified without having to run the query manually.

```swift
query.updateHandler = { (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in

        guard let samples = samplesOrNil, let deletedObjects = deletedObjectsOrNil else {
            // Handle the error here.
            fatalError("*** An error occurred during an update: \(errorOrNil!.localizedDescription) ***")
        }
```

- The updateHandler does not work in the background, but it does persist between loads. As soon as you open your app you will be immediately notified of any changes that have been made.

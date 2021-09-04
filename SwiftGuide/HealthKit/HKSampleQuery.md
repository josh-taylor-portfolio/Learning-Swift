# HKSampleQuery

- Use queries to get data that changes over time such as step counts, heart rate, body mass, and so on.
- Queries allow you to fetch a snapshot of data from the HealthKit store.
- Useful if you want to sort results or limit the total number of samples returned.

HKSampleQuery init:  
```swift
1. init(sampleType: HKSampleType, 
2. predicate: NSPredicate?, 
3. limit: Int, 
4. sortDescriptors: [NSSortDescriptor]?, 
5. resultsHandler: @escaping (HKSampleQuery, [HKSample]?, Error?) -> Void)
```
1.  The type of sample to search for. This object can be an instance of the HKCategoryType, HKCorrelationType, HKQuantityType, or HKWorkoutType class.
2.  A predicate that limits the results returned by the query. Pass nil to receive all the samples of the specified type.
3.  The maximum number of samples returned by the query. If you want to return all matching samples, use HKObjectQueryNoLimit.
4.  An array of sort descriptors that specify the order of the results returned by this query. Pass nil if you don’t need the results in a specific order.
5.  A block that is called when the query finishes executing.
    * query: A reference to the query that called this block.
    * results: An array containing the samples found by the query, or nil if an error occurs.
    * error: If an error occurs, this parameter contains an object describing the error. Otherwise, its value is nil.

Simple Query:  
```swift
   let sampleType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
   let query = HKSampleQuery.init(sampleType: sampleType!,
                                  predicate: nil,
                                  limit: HKObjectQueryNoLimit,
                                  sortDescriptors: nil) { (query, results, error) in
        print(results)
    }
    
    healthStore.execute(query)
```

HKSampleQuery With Predicate:   

```swift 
// HKSampleQuery with a predicate
func testSampleQueryWithPredicate() {
1.    let sampleType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)
    
2.    let today = Date()
3.    let startDate = Calendar.current.date(byAdding: .month, value: -3, to: today)
    
4.    let predicate = HKQuery.predicateForSamples(withStart: startDate, end: today, options: HKQueryOptions.strictEndDate)
    
5.    let query = HKSampleQuery.init(sampleType: sampleType!,
                                   predicate: predicate,
                                   limit: HKObjectQueryNoLimit,
                                   sortDescriptors: nil) { (query, results, error) in
                                    print(results)
    }
    
6.   healthStore.execute(query)
}
```

1. sampleType is set to HKQuantityTypeIdentifier.bodyMass
2. today gets the current Date
3. sets startDate to 3 months ago today
4. creates a predicate with with the startDate as 3 months ago and end date to today
5. init the query with the predciate
6. execute the query

# HKSampleQuery With Sort Descriptors

```swift
let query = HKSampleQuery.init(sampleType: sampleType!,
                               predicate: predicate,
                               limit: HKObjectQueryNoLimit,
                               sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)]) { (query, results, error) in
                                print(results)
}
[NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)]
//use the square brackets because sortDescriptors is expecting an array to be passed.
```

# When to use a HKSampleQuery

- HKSampleQuery works well for types of requests where the data stored is the final value.  
- Where it is less appropriate for use is when samples provided are used together to provide a value for a day or for an hour.

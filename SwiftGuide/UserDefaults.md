# UserDefaults

- The UserDefaults object, formerly known as NSUserDefaults, is exceptionally useful for storing small pieces of data in your app. You use it to save your app user’s settings, set some “flags”, or simply use it as a tiny data store.
- is a .plist file in the app's package
- Use it to set and get simple pieces of data
- Structure is similar to a dictionary with a key value pair

### Saving, Getting, Removing data to UserDefaults

- Bool, Int, Float, Double, String, Data, Date, URL, Array, and Dicitonary. 

- The UserDefaults object, formerly known as NSUserDefaults, is exceptionally useful for storing small pieces of data in your app. You use it to save your app user’s settings, set some “flags”, or simply use it as a tiny data store.

```swift
// example of saving a String
let name = "John Doe"
UserDefaults.standard.set(name, forKey: "name")

// Getting value "name"
// name is an optional String
let name = NSUserDefaults.standard.string(forKey: "name")

// You can also use the nil-coalescing operator ?? to provide a default value:
let name = NSUserDefaults.standard.string(forKey: "name") ?? "Unknown user"

// removing "name"
UserDefaults.standard.removeObject(forKey: "name")
```

- It’s worth noting here that these getters will return optional values, so the type of name is String?. When the "name" key doesn’t exist, the above code returns nil.
- Getters for other types are:
    - url(forKey:), array(forKey:), dictionary(forKey:), string(forKey:), stringArray(forKey:) (with type [String]?), data(forKey:), bool(forKey:), integer(forKey:), float(forKey:), and double(forKey:).

### When to Use UserDefaults

- Good use cases for UserDefaults are:
    - User information, like name, email address, age, occupation
    - App settings, like user interface language, app color theme or “detailed vs. simple UI”
    - Flags (true or false)
        - If the user already has completed the app’s onboarding, with "hasOnboarded"
        - If the user has already upgraded the in-app database, with "databaseUpgraded"
        - If the user is one of your app’s initial beta testers, and should get an upgrade for free, with "isBetaTester_2013"

#### Important: Don’t use UserDefaults for personal or sensitive data. The user defaults are a simple .plist file in the app package, so it’s fairly easy to get the data out and change it. Store one-time passwords, UUIDs, IAP data and even high-score data in the iOS keychain.


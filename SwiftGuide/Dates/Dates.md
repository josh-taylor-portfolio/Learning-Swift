# Dates

### Get Current Date and Time

```swift
// Sep 16, 2021 at 11:34 PM
let now = Date()
```

Date:
- is part of the Foundation framework, so it’s a fundamental type to work with dates on iOS, macOS, tvOS, watchOS and Catalyst.
- represents a single point in time, regardless of locale or calendar setting.
- has millisecond precision, i.e. it can represent points in time up to 1/1000th of a second.

## Important: Remember following guidelines for working with date and time:
- Don’t use calculations like 60 * 60 * 24 for time intervals, because that’ll go awry for leap seconds
- Store dates as native Date objects or as timestamps, but know that timestamps aren’t perfect
- Store dates in UTC/GMT whenever you can, only use your local timezone if you’re 100% certain that your app never crosses timezones
- When representing dates as strings (i.e., for your app’s users), take in account an iPhone’s locale and calendar settings


## Formatting

- Convert Date to String
    1. Create a DateFormatter object (the right way)
    2. Convert the date to string with the formatter

```swift
let date = Date()

let formatter = DateFormatter()
formatter.dateStyle = .full
formatter.timeStyle = .full

let datetime = formatter.string(from: date)
```

### Example of Styles
|	|Date|	Time|
|---|---|---|
|.none|	(nothing!)|	(nothing!)|
|.short|	3/11/20|	3:32 PM|
|.medium|	Mar 11, 2020|	3:32:07 PM|
|.long|	March 11, 2020|	3:32:07 PM GMT+1|
|.full|	Wednesday, March 11, 2020|	3:32:07 PM Central European Standard Time|

Want to know what your system’s locale is?
```swift
let formatter = DateFormatter()
print(formatter.locale) // en_US
```

- DateFormatter object will use the iPhone’s system locale by default. If you’re creating a date formatter object, and you use dateStyle and timeStyle, and then string(from:), you’re almost guaranteed to create a textual representation of date/time in the user’s locale.

```swift
let formatter = DateFormatter()
formatter.locale = Locale(identifier: "nl_NL")
formatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")

let datetime = formatter.string(from: now)
print(datetime) // "17-09-2021"
```

### String to Date: Parsing Dates & Timezones

- Why would you want to convert strings to dates? A few scenarios:
    - You’ve received a well-formatted ISO 8601 string from a JSON-based webservice, and you need to convert it to a Date in Swift
    - You’ve stored a Unix timestamp in a database, that you need to parse to Date, and subsequently display to your app’s users
    - Data you’re working with has some obscure date formatting, that you want to parse, and write back in a more sensible format

```swift
let formatter = DateFormatter()
formatter.dateFormat = "dd-MM-yyyy HH:mm:ss Z"

let datetime = formatter.date(from: "13-03-2020 13:37:00 +0100")
print(datetime!)
// Output: 2020-03-13 12:37:00 +0000
```

## Creating Dates With DateComponents

- work with the individual parts of a date or time, like days, day of the week, or minutes

```swift
let components = DateComponents(calendar: Calendar.current, timeZone: TimeZone(abbreviation: "GMT"), year: 2020, month: 1, day: 1)
print(components.date)
```


## Calculating Date/Time Durations With DateComponents

```swift
let now = DateComponents(calendar: Calendar.current, year: 2020, month: 2, day: 1)
let duration = DateComponents(calendar: Calendar.current, month: 2)
let later = Calendar.current.date(byAdding: duration, to: now.date!)
print(later)
// Output: 2020-04-01 00:00:00
```


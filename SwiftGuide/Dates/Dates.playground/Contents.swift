import UIKit

let date = Date()

let formatter = DateFormatter()
formatter.locale
formatter.dateStyle = .full
formatter.timeStyle = .full

var datetime = formatter.string(from: date)

formatter.locale = Locale(identifier: "nl_NL")
formatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")

datetime = formatter.string(from: date)

formatter.dateFormat = "dd-MM-yyyy HH:mm:ss Z"

let datetimeFromString = formatter.date(from: "13-03-2020 13:37:00 +0100")
print(datetimeFromString!)


let components = DateComponents(calendar: Calendar.current, timeZone: TimeZone(abbreviation: "GMT"), year: 2020, month: 1, day: 1)
print(components.date)

# UIAlertController

- class to display alert dialogs

### Displaying Alerts with UIAlertController

1. Create A UIAlertController with a Title, message and preferredStyle
2. add UIAlertActions aka buttons with title, style, and handler
3. Present the UIAlertController


```swift
1) let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)

2) alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

3)self.present(alert, animated: true)
```

<img width="517" alt="Screen Shot 2021-09-13 at 9 28 07 PM" src="https://user-images.githubusercontent.com/89819167/133184648-6ba3078a-f5be-457b-9ce4-ba47d9854e3d.png">

- You always have to “present” an alert, to show it to the user. Presenting a UIAlertController can only be done on a currently visible view controller that’s part of the view controller stack.
- As a design rule, you should always have a Cancel option that dismisses the alert and reverts the app to its previous state. This helps a user who’s confused, and wants to go back without making a decision at all.

### UIAlertController Styles: Alert or Action Sheet?

When creating your alert controller, with the UIAlertController(··· preferredStyle:) initializer, you can choose between two options:

1. A simple alert, with the .alert constant
2. An action sheet, with the .actionSheet constant

<img width="560" alt="Screen Shot 2021-09-13 at 9 36 12 PM" src="https://user-images.githubusercontent.com/89819167/133185536-34965eeb-2b64-47ff-8de1-2dcfbf8cbc7c.png">

Action Sheets have a few benefits:
1. Action sheets slide up from the bottom of the iPhone screen, so you can reach its buttons with your thumb.
2. You can fit more text in an action sheet, compared to the alert style, for the title, message and buttons.
3. Action sheet buttons fit more text, so you usually need less text for the title and message, compared to an alert.

When should you use an alert, and when an action sheet?

1. It’s best to use an action sheet for choosing between multiple similar options.
2. When you need explicit confirmation on a positive and negative action, like “Yes” and “No”, or “OK” and “Cancel”, it’s best to use an alert style dialog.

- Often, action sheets don’t have a title or message at all. Instead, you let the buttons speak for themselves. When you present a user with an action sheet, always give them the option to get out of the action sheet with a Cancel button.

### Responding to UIAlertController with Actions

```swift
alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
    print("Yay! You brought your towel!")
}))
```

Actions, and their buttons, can have three styles:

1. Default, with the constant .default
2. Cancel, with the constant .cancel
    - By default, the .cancel action is highlighted in the alert.
3. Destructive, with the constant .destructive
    - The .destructive style is usually red, indicating to your app’s users that this is a dangerous action or one that cannot be undone.

- Even if you change the order of adding the actions to the alert, the Cancel button is always shown first. The UIAlertController can also have a preferred action. When specified, the alert then highlights that action.
- The cancel button is the preferred action by default. You can also assign an action yourself, but you’ll first have to add it with the addAction(_:) function before assigning it to the preferredAction property of UIAlertController.

### Working with User Input in Alert Text Fields

```swift
let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

alert.addTextField(configurationHandler: { textField in
    textField.placeholder = "Input your name here..."
})

alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

    if let name = alert.textFields?.first?.text {
        print("Your name: \(name)")
    }
}))

self.present(alert, animated: true)
```

<img width="470" alt="Screen Shot 2021-09-13 at 10 05 04 PM" src="https://user-images.githubusercontent.com/89819167/133188100-c1db0a30-e723-4ac5-a311-495a10319e5e.png">

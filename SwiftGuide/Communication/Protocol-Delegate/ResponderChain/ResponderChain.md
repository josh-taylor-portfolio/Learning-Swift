# Responder Chain

- Apps receive and handle events using responder objects. A responder object is any instance of the UIResponder class, and common subclasses include UIView, UIViewController, and UIApplication.
- Responders receive the raw event data and must either handle the event or forward it to another responder object.
- When your app receives an event, UIKit automatically directs that event to the most appropriate responder object, known as the first responder.
- Unhandled events are passed from responder to responder in the active responder chain, which is the dynamic configuration of your app’s responder objects.

![image](https://user-images.githubusercontent.com/89819167/133116677-15c7e895-2cb6-40b3-9910-3e5413b36e1b.png)

- If the text field does not handle an event, UIKit sends the event to the text field’s parent UIView object, followed by the root view of the window. From the root view, the responder chain diverts to the owning view controller before directing the event to the window. If the window cannot handle the event, UIKit delivers the event to the UIApplication object, and possibly to the app delegate if that object is an instance of UIResponder and not already part of the responder chain.


![image](https://user-images.githubusercontent.com/89819167/133117447-ddd92142-513b-4895-bd0c-a3cea7e7f18d.png)

- Controls communicate directly with their associated target object using action messages.
- 

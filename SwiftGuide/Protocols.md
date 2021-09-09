# Protocols

- A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
- Only define functions and properties
- The power of protocols is that they formalize the connection between different parts of your code, without providing implementations. This allows you to build rigid structures in your code, without tightly coupling your code’s components.
- 

```
protocol name {
    body
}
```

Example of a protocol:
```swift
protcol Animal {
  func makeSound()
}

class Dog: Animal {

  func makeSound() {
    print("Bark Bark")
  }
}

```

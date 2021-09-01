# Creating a blank Swift Package
1. create a new Swift Package using the ⌃⇧⌘N or File > New > Swift Package....
2. Configure your packaged based on the link below
* Source - compatables
* Test - unit tests

[Apple Package Documentation](https://developer.apple.com/documentation/swift_packages/package)


# Host your Package on GitHub.com

1. create empty public repository on GitHub.com
2. add local package to newly created repo

Swift Package Manager supports integrating any proper git repository as a project dependency, so creating one on Github.com is basically the only thing you have to do to make it happen.
Use semantic versioning (https://semver.org/)

# Fetch your Swift Package via Swift Package Manager

<img width="726" alt="Screen Shot 2021-08-31 at 7 56 47 PM" src="https://user-images.githubusercontent.com/89819167/131594695-99933a92-5c7f-4371-b5f7-f51079f3918d.png">


1. open up the SPM dialogue in Xcode first (File > Swift Package > Add Package Dependency)
2. add the url of where you package is hosted

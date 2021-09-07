# Protocol Delegate

- Delegation is usually a good choice when a type needs to be usable in many different contexts, and when it has a clear owner in all of those contexts
- establishing a 1:1 relationship between caller and owner

Conventions:
1. Start the name of the Delegate or DataSource with the type that it is delegating
2. The first argument should be the delegated object so mulitple instances can be distingushed between then and proper action can be take
3. Do not leak implementation. for example, for a button pass do not pass the   

This pattern can be used as a Delegate or DataSource:  
- Delegate
    -  Used to pass to the object that implements the delegate method
    -  Always the implementing class to pass data to the Service

Create a protocol CryptoServiceDelegate that will be responsible for passing the symbol and price to the delegated Object and create a datasource so the calling the  
object call set the symbol

```swift

protocol CryptoServiceDelegate: AnyObject {
    func didFetchCyrptoPrice(cryptoService: CryptoRateService, symbol: String, price: Double)
}

protocol CryptoServiceDataSource: AnyObject {
    var symbol: String? { get }
}

class CryptoRateService {

    weak var delegate: CryptoServiceDelegate?
    weak var dataSource: CryptoServiceDataSource?

    func fetchCryptoRate() {
        guard let dataSource = dataSource, let city = dataSource.symbol else {
            assertionFailure("DataSource not set")
            return
        }
        //getRateForSymbol is an async call 
        let cryptoRate = getRateForSymbol(dataSourc.symbol)
        delegate?.didFetchWeather(weather)
    }
}

```

Inside the Viewcontroller can register as the delegate and datasource like this:
```swift

class ViewController {

    let cryptoRateService = CryptoRateService()

    override func viewDidLoad() {
        super.viewDidLoad()
          
        cryptoRateService.delegate = self
        cryptoRateService.dataSource = self
    }

  
}
```

Finally, the Viewcontroller would need to implement the following methods:
```swift
extension ViewController: CryptoServiceDelegate {
    didFetchCyrptoPrice(cryptoService: CryptoRateService, symbol: String, price: Double)
        //setup views with symbol and price
    }
}

extension ViewController: CryptoServiceDataSource {
    var symbol: String? {
        let _symbol: String? = "Bitcoin"
        return _symbol
    }
}


```


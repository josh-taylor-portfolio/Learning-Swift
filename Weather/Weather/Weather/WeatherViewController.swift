//
//  ViewController.swift
//  Weather
//
//  Created by Joshua Taylor on 9/4/21.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    private let weatherLogic = WeatherLogicController()
    
    let locationManager = CLLocationManager()

    let backgroundView = UIImageView()
    
    let searchStackView = UIStackView()
    let locationButton = UIButton()
    let activityIndicatorContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let activityIndicatorView = UIActivityIndicatorView()

    let searchTextField = UITextField()
    
    let weatherInfoStackView = UIStackView()
    let weatherImageView = UIImageView()
    let tempLabel = UILabel()
    let cityLabel = UILabel()
    let lastUpdatedLabel = UILabel()
    
    let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        style()
        layout()
        
    }
    
}

extension WeatherViewController {
    
    func setup() {
        // Create a CLLocationManager and assign a delegate
        locationManager.delegate = self

        // Request a user’s location once
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()

        searchTextField.delegate = self

        if let weatherData = WeatherDefaults.getWeatherData() {
            handleSuccess(weatherModel: weatherData)
        }

        activityIndicatorView.hidesWhenStopped = false
        self.activityIndicatorView.startAnimating()
    }
    
    func style() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "dayBackground")
        backgroundView.contentMode = .scaleAspectFill
        
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.spacing = 8
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.addAction(
            UIAction { [weak self] action in
                self?.activityIndicatorView.startAnimating()
                self?.locationManager.requestLocation()
            }, for: .primaryActionTriggered)
        locationButton.tintColor = .label

        activityIndicatorContainerView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorContainerView.backgroundColor = .clear

        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = .black
        activityIndicatorView.backgroundColor = .clear

        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.placeholder = "Search"
        searchTextField.textAlignment = .left
        searchTextField.borderStyle = .roundedRect
        
        //Weather Stackview
        weatherInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherInfoStackView.spacing = 8
        weatherInfoStackView.axis = .vertical
        weatherInfoStackView.contentMode = .scaleAspectFit
        
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.tintColor = .black
        weatherImageView.contentMode = .scaleAspectFit
        
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.tintColor = .black
        tempLabel.numberOfLines = 1
        tempLabel.textAlignment = .center
        
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.tintColor = .black
        cityLabel.numberOfLines = 1
        cityLabel.textAlignment = .center

        lastUpdatedLabel.translatesAutoresizingMaskIntoConstraints = false
        lastUpdatedLabel.tintColor = .black
        lastUpdatedLabel.numberOfLines = 1
        lastUpdatedLabel.textAlignment = .center
        
    }
    
    func layout() {
        
        view.addSubview(backgroundView)
        view.addSubview(searchStackView)
        view.addSubview(weatherInfoStackView)

        activityIndicatorContainerView.addSubview(activityIndicatorView)
        
        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchTextField)
        searchStackView.addArrangedSubview(activityIndicatorContainerView)
        
        weatherInfoStackView.addArrangedSubview(weatherImageView)
        weatherInfoStackView.addArrangedSubview(tempLabel)
        weatherInfoStackView.addArrangedSubview(cityLabel)
        weatherInfoStackView.addArrangedSubview(lastUpdatedLabel)

        activityIndicatorView.frame = activityIndicatorContainerView.bounds
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            searchStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchStackView.trailingAnchor, multiplier: 1),
            
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),

            activityIndicatorContainerView.widthAnchor.constraint(equalToConstant: 40),
            activityIndicatorContainerView.heightAnchor.constraint(equalToConstant: 40),

            activityIndicatorView.widthAnchor.constraint(equalToConstant: 40),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 40),
            
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            
            weatherInfoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            weatherInfoStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: weatherInfoStackView.trailingAnchor, multiplier: 1),
            
            weatherImageView.heightAnchor.constraint(equalToConstant: 120),
            
            tempLabel.widthAnchor.constraint(equalTo: weatherInfoStackView.widthAnchor),
            cityLabel.widthAnchor.constraint(equalTo: weatherInfoStackView.widthAnchor),
            lastUpdatedLabel.widthAnchor.constraint(equalTo: weatherInfoStackView.widthAnchor)
            
        ])
    }
    
    func makeTempAttributedText(with string: String) -> NSAttributedString{
        
        let boldAttributes: [NSAttributedString.Key: AnyObject] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 100)
        ]
        
        let plainTextAttributes: [NSAttributedString.Key: AnyObject] = [
            .font: UIFont.boldSystemFont(ofSize: 80),
            .foregroundColor: UIColor.black
        ]
        
        let text = NSMutableAttributedString(string: string, attributes: boldAttributes)
        text.append(NSAttributedString(string: "°C", attributes: plainTextAttributes))
        
        return text
    }
    
    func makeCityAttributedText(with string: String) -> NSAttributedString{
        
        let boldAttributes: [NSAttributedString.Key: AnyObject] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.preferredFont(forTextStyle: .largeTitle)
        ]
        
        let text = NSMutableAttributedString(string: string, attributes: boldAttributes)
        
        return text
    }

    func makeLastUpdateAttributedText(with string: String) -> NSAttributedString{

        let boldAttributes: [NSAttributedString.Key: AnyObject] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.preferredFont(forTextStyle: .subheadline)
        ]

        let text = NSMutableAttributedString(string: string, attributes: boldAttributes)

        return text
    }

    func render(result: ViewStateResult) {

        self.activityIndicatorView.stopAnimating()
        switch result{
        case .success(let weatherModel):
            handleSuccess(weatherModel: weatherModel)
        case .failure(let error):
            handleError(weatherServiceError: error)
        }
    }

    func handleSuccess(weatherModel: WeatherModel) {
        self.cityLabel.attributedText = makeCityAttributedText(with: weatherModel.city)
        self.tempLabel.attributedText = makeTempAttributedText(with: weatherModel.temperature)
        self.lastUpdatedLabel.attributedText = makeLastUpdateAttributedText(with: weatherModel.lastUpdated)
        self.weatherImageView.image = weatherModel.getWeatherImage()
        WeatherDefaults.saveWeatherData(weatherData: weatherModel)
    }

    func handleError(weatherServiceError: WeatherServiceError) {
        var title: String
        var message: String

        switch weatherServiceError {
        case .general(reason: let data):
            title = "General Weather Service Error"
            message = "\(data)"
        case .network(statusCode: let statusCode):
            title = "Network Weather Service Error"
            if statusCode == 401 {
                message = "Response status code: \(statusCode), Check your Api Key"
            } else {
                message = "Response status code: \(statusCode), expected 200"
            }
        case .parsing:
            title = "Parsing Weather Service Error"
            message = "Problem parsing response data"
        case .invalidUrl:
            title = "Invalid Weather Service Url Error"
            message = "Problem parsing URL"
        case .data(reason: let reason):
            title = "Empty Data"
            message = reason
        }

        let alert = createUIAlertControllerWithOkayAction(title: title, message: message)
        self.present(alert, animated: true)
    }

}

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locations = locations.first {
            weatherLogic.getWeatherForLatLon(lat: locations.coordinate.latitude, lon: locations.coordinate.longitude) { [weak self] result in
                DispatchQueue.main.async {
                    self?.locationManager.stopUpdatingLocation()
                    self?.render(result: result)
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let title = "Error Getting Location"
        let message = "\(error)"
        let alert = createUIAlertControllerWithOkayAction(title: title, message: message)
        self.present(alert, animated: true)
    }

}

extension WeatherViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        guard let city = textField.text, textField.hasText else {
            return true
        }
        self.activityIndicatorView.startAnimating()
        weatherLogic.getWeatherForCity(city: city) { [weak self] result in
            DispatchQueue.main.async {
                self?.render(result: result)
            }
        }
        weatherService.fetchWeatherData(city: city)
        textField.text = nil

        return true
    }
}


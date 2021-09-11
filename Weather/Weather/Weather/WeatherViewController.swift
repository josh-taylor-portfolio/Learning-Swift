//
//  ViewController.swift
//  Weather
//
//  Created by Joshua Taylor on 9/4/21.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    let locationManager = CLLocationManager()

    let backgroundView = UIImageView()
    
    let searchStackView = UIStackView()
    let locationButton = UIButton()
    let searchButton = UIButton()
    let searchTextField = UITextField()
    
    let weatherInfoStackView = UIStackView()
    let weatherImageView = UIImageView()
    let tempLabel = UILabel()
    let cityLabel = UILabel()
    
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
        
        weatherService.delegate = self
    }
    
    func style() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "dayBackground")
        backgroundView.contentMode = .scaleAspectFill
        
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.spacing = 8
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.addTarget(self, action: #selector(locationPressed(_:)), for: .primaryActionTriggered)
        locationButton.tintColor = .label
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .label
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.placeholder = "Search"
        searchTextField.textAlignment = .left
        searchTextField.borderStyle = .roundedRect
        searchButton.backgroundColor = .systemFill
        
        //Weather Stackview
        weatherInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherInfoStackView.spacing = 8
        weatherInfoStackView.axis = .vertical
        weatherInfoStackView.contentMode = .scaleAspectFit
        
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.image = UIImage(systemName: "sun.max")
        weatherImageView.tintColor = .label
        weatherImageView.contentMode = .scaleAspectFit
        
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.tintColor = .label
        tempLabel.numberOfLines = 1
        tempLabel.textAlignment = .center
        tempLabel.attributedText = makeTempAttributedText(with: "21")
        
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.tintColor = .label
        cityLabel.numberOfLines = 1
        cityLabel.attributedText = makeCityAttributedText(with: "Chicago")
        cityLabel.textAlignment = .center
        
    }
    
    func layout() {
        
        view.addSubview(backgroundView)
        view.addSubview(searchStackView)
        view.addSubview(weatherInfoStackView)
        
        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchTextField)
        searchStackView.addArrangedSubview(searchButton)
        
        weatherInfoStackView.addArrangedSubview(weatherImageView)
        weatherInfoStackView.addArrangedSubview(tempLabel)
        weatherInfoStackView.addArrangedSubview(cityLabel)
        
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

            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            
            weatherInfoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            weatherInfoStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: weatherInfoStackView.trailingAnchor, multiplier: 1),
            
            weatherImageView.heightAnchor.constraint(equalToConstant: 120),
            
            tempLabel.widthAnchor.constraint(equalTo: weatherInfoStackView.widthAnchor),
            cityLabel.widthAnchor.constraint(equalTo: weatherInfoStackView.widthAnchor),
            
        ])
    }
    
    func makeTempAttributedText(with string: String) -> NSAttributedString{
        
        let boldAttributes: [NSAttributedString.Key: AnyObject] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.boldSystemFont(ofSize: 100)
        ]
        
        let plainTextAttributes: [NSAttributedString.Key: AnyObject] = [
            .font: UIFont.boldSystemFont(ofSize: 80)
        ]
        
        let text = NSMutableAttributedString(string: string, attributes: boldAttributes)
        text.append(NSAttributedString(string: "°C", attributes: plainTextAttributes))
        
        return text
    }
    
    func makeCityAttributedText(with string: String) -> NSAttributedString{
        
        let boldAttributes: [NSAttributedString.Key: AnyObject] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.preferredFont(forTextStyle: .largeTitle)
        ]
        
        let text = NSMutableAttributedString(string: string, attributes: boldAttributes)
        
        return text
    }
    
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    @objc func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locations = locations.first {
            locationManager.stopUpdatingLocation()
            weatherService.fetchWeatherData(lat: locations.coordinate.latitude,
                                            long: locations.coordinate.longitude)
            
        }
    }
    

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error getting location \(error)")
    }
    
    
}

extension WeatherViewController: WeatherServiceDelegate {
    func didFeatchWeather(weatherSerivce: WeatherService, result: WeatherResult) {
        switch result {
        case .success(let data):
            self.handleSuccess(weatherModel: data)
        case .failure(let error):
            self.handleError(weatherServiceError: error)
        }
    }
    
    func handleSuccess(weatherModel: WeatherModel) {
        
        
        
    }
    
    func handleError(weatherServiceError: WeatherServiceError) {
        
        
        switch weatherServiceError {
        case .general(reason: let data):
            print("\(data)")
        case .network(statusCode: let statusCode):
            print("\(statusCode)")
        case .parsing:
            print("Parsing error")
        }
    
    }
}


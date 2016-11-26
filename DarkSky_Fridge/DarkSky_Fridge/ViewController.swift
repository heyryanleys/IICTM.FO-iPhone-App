//
//  ViewController.swift
//  DarkSky_Fridge
//
//  Created by Ryan Leys on 11/26/16.
//  Copyright © 2016 heyryanleys. All rights reserved.
//

// Importing Pods
import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    // Linking UI
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    // Requesting Location
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    // Can't Display Weather
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        handleError(message: "Unable to load your location.")
    }
    
    // Setting Error
    func handleError(message: String) {
        let alert = UIAlertController(title: "Error Loading Forecast", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Displaying Weather Based On Location
    func updateLabels(with data: WeatherData, at location: CLLocation) {
        self.tempLabel.text = data.temperature
        
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            let locationName = placemarks?.first?.locality ?? "Unknown Location"
            self.locationLabel.text = locationName
        }
    }
    
    
 /*   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let longitude = String(location.coordinate.longitude)
            let latitude = String(location.coordinate.latitude)
            
            DarkSky.weatherForCoordinates(latitude: latitude, longitude: longitude) { weatherData, error in
                
                if let weatherData = weatherData {
                    print(weatherData)
                }
                    
                else if let _ = error {
                    self.handleError(message: "Oops! We can't seem to find your location.")
                }
                
            }
        }
    } */
    




    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
/*    override func viewWillAppear(_ animated: Bool) {
        DarkSky.weatherForCoordinates(latitude: "37", longitude: "122") { (response, error) in
            print("\(response)")
            print("\(error)")
        }
    }

*/

}

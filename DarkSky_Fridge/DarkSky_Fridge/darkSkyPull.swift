//
//  darkSkyPull.swift
//  DarkSky_Fridge
//
//  Created by Ryan Leys on 11/26/16.
//  Copyright © 2016 heyryanleys. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WeatherData {
    
    var temperature: String
    
    init(data: Any) {
        let json = JSON(data)
        let currentWeather = json["currently"]
        
        if let temperature = currentWeather["temperature"].float {
            self.temperature = String(format: "%.0f", temperature) + " ºF"
        } else {
            self.temperature = "N/A"
        }
    }
    
}

//
//  DarkSky.swift
//  DarkSky_Fridge
//
//  Created by Ryan Leys on 11/26/16.
//  Copyright © 2016 heyryanleys. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class DarkSky {
    
    private static let baseURL = "https://api.darksky.net/forecast/"
    private static let apiKey = "010210fa12acc991ec544005654416a3"
    
    static func weatherForCoordinates(latitude: String, longitude: String, completion: @escaping (Any?, Error?) -> ()) {
        
        let url = baseURL + apiKey + "/\(latitude),\(longitude)"
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let result):
                completion(WeatherData(data: result), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    
    }
}

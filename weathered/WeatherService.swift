//
//  WeatherService.swift
//  weathered
//
//  Created by dubie on 8/4/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {

    static let instance = WeatherService()
    
    func downloadWeatherDetails(){
        let url = URL( string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseJSON{ (response) in
        
            print(response.result.value ?? "")
        }
    }
    
}

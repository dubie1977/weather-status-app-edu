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
    fileprivate var _currentWeather = CurrentWeather()
    
    var currentWeather: CurrentWeather{
        get{
            return _currentWeather
        } set{
            _currentWeather = newValue
        }
    }
    
    func downloadWeatherDetails(compleated: @escaping DownloadComplete){
        let url = URL( string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseData{ (response) in
        
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
            //print(response.result.value ?? "")
            print("City Name: "+self.currentWeather.cityName)
            print("Weather Type: "+self.currentWeather.weatherType)
            print("Current Temp: \(self.currentWeather.currentTemp)")
            print("Current Date: "+self.currentWeather.date)
            compleated()
        }
    }
    
}

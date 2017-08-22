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
    fileprivate var _forcast = [Forcast]()
    
    var currentWeather: CurrentWeather{
        get{
            return _currentWeather
        } set{
            _currentWeather = newValue
        }
    }
    
    var forcast: [Forcast]{
        get{
            return _forcast
        } set {
            _forcast = newValue
        }
    }
    
    func downloadWeatherDetails(compleated: @escaping DownloadComplete){
        let url = URL( string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseData{ (response) in
        
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
            //print("City Name: "+self.currentWeather.cityName)
            //print("Weather Type: "+self.currentWeather.weatherType)
            //print("Current Temp: \(self.currentWeather.currentTemp)")
            //print("Current Date: "+self.currentWeather.date)
            compleated()
        }
    }
    
    func downloadForecast (compleated: @escaping DownloadComplete){
        let url = URL(string: API_URL_FORCAST)
        Alamofire.request(url!).responseData { (response) in
            //print("Forcast download isSucessful: \(response.result.isSuccess)")
            self.forcast = Forcast.loadForecastFormData(response.data!)
            if self.forcast.count > 0{
                self.forcast.remove(at: 0)
            }
            compleated()
            
        }
    }
    
}

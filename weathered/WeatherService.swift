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
        /*var locationURL: String
        locationURL = "lat=\(Location.instance.latitude)&lon=\(Location.instance.longitude)"
        let url = URL( string: API_URL_CURRENT_WEATHER+locationURL+API_URL_CURRENT_WEATHER_END)
        //print(url?.absoluteString ?? 0)
        Alamofire.request(url!).responseData{ (response) in
        
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
            compleated()
        }*/
        downloadWeatherDetailsCoordinates {
            print("download current by coordinates done")
            compleated()
            
        }
    }
    
    func downloadWeatherDetailsCoordinates(compleated: @escaping DownloadComplete){
        var locationURL: String
        locationURL = "lat=\(Location.instance.latitude)&lon=\(Location.instance.longitude)"
        let url = URL( string: API_URL_CURRENT_WEATHER+locationURL+API_URL_CURRENT_WEATHER_END)
        //print(url?.absoluteString ?? 0)
        Alamofire.request(url!).responseData{ (response) in
            
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
            compleated()
        }
    }
    
    func downloadForecast (compleated: @escaping DownloadComplete){
        var locationURL: String
        locationURL = "lat=\(Location.instance.latitude)&lon=\(Location.instance.longitude)"
        let url = URL(string: API_URL_FORCAST+locationURL+API_URL_FORCAST_END)
        //print(url?.absoluteString ?? 0)
        Alamofire.request(url!).responseData { (response) in
            self.forcast = Forcast.loadForecastFormData(response.data!)
            if self.forcast.count > 0{
                self.forcast.remove(at: 0)
            }
            compleated()
            
        }
    }
    
}

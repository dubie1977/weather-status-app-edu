//
//  Forcast.swift
//  weathered
//
//  Created by Joseph DuBay on 8/15/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Foundation
import SwiftyJSON

class Forcast{
    
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _highTemp: Int!
    fileprivate var _lowTemp: Int!
    
    var date: String {
        get{
            return _date
        } set{
            _date = newValue
        }
    }
    
    var weatherType: String{
        get{
            return _weatherType
        } set{
            _weatherType = newValue
        }
    }
    
    var highTemp: Int{
        get{
            return _highTemp
        } set{
            _highTemp = newValue
        }
    }
    
    var lowTemp: Int{
        get{
            return _lowTemp
        } set {
            _lowTemp = newValue
        }
    }
    
    class func loadForecastFormData(_ APIData: Data) -> [Forcast]{
        
        var forcast = [Forcast]()
        let json = JSON(data: APIData)
        
        if let list = json["list"].array {
            for day in list {
                let dayForecast = Forcast()
                dayForecast.highTemp = day["temp"]["max"].intValue
                dayForecast.lowTemp = day["temp"]["min"].intValue
                dayForecast.weatherType = day["weather"][0]["main"].stringValue
                
                let date = day["dt"].doubleValue
                let unixConvertedDate = Date(timeIntervalSince1970: date)
                dayForecast.date = unixConvertedDate.dayOfTheWeek()

                forcast.append(dayForecast)
            }
        }
        
        return forcast
    }
}


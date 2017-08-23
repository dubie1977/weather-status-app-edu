//
//  Constants.swift
//  weathered
//
//  Created by dubie on 8/4/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let API_KEY = "&appid=06ebd96da2577f190db80f9382ed7639"
let API_UNITS = "&units=imperial"
let LONG = Location.instance.longitude
let LAT = Location.instance.latitude


let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?"
let API_URL_CURRENT_WEATHER_END = "\(API_UNITS)\(API_KEY)"


let API_URL_FORCAST = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let API_URL_FORCAST_NUMBER_OF_DAYS = 8
let API_URL_FORCAST_END = "&cnt=\(API_URL_FORCAST_NUMBER_OF_DAYS)\(API_UNITS)\(API_KEY)"


let API_HOMEPAGE = "http:openweathermap.org"

let NOTIF_DOWNLOAD_COMPLETE = NSNotification.Name("dataDownloaded")

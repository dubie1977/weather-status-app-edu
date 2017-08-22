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
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=45.78&lon=-122.54\(API_UNITS)\(API_KEY)"
let API_URL_FORCAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=45.78&lon=-122.54&cnt=8\(API_UNITS)\(API_KEY)"

let API_HOMEPAGE = "http:openweathermap.org"

let NOTIF_DOWNLOAD_COMPLETE = NSNotification.Name("dataDownloaded")

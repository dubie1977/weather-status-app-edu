//
//  AppDelegate.swift
//  weathered
//
//  Created by dubie on 7/21/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Cocoa
import CoreLocation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, CLLocationManagerDelegate {


    //varibles
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var locationAuth = false
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.distanceFilter = 1000
        locationManager.startUpdatingLocation()
        
        statusItem.button?.title = "--°"
        statusItem.action = #selector(AppDelegate.displayPopUp(_:))
        
        let updateWeatherData = Timer.scheduledTimer(timeInterval: 10/*(60 * 15)*/, target: self, selector: #selector(AppDelegate.downloadWeatherData), userInfo: nil, repeats: true)
        updateWeatherData.tolerance = 60
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch(status){
        case CLAuthorizationStatus.denied:
            print("auth denied")
            self.locationAuth = false
            //self.locationManager.stopUpdatingLocation()
        case CLAuthorizationStatus.authorizedAlways:
            print("auth approved")
            self.locationAuth = true
        case CLAuthorizationStatus.notDetermined:
            print("auth unknown")
            self.locationAuth = false
        default:
            print("other")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[locations.count - 1]
        Location.instance.latitude = currentLocation.coordinate.latitude
        Location.instance.longitude = currentLocation.coordinate.longitude
        Location.instance.locationProvided = true
        Location.instance.useZip = false
        downloadWeatherData()
    }
    
    @objc func downloadWeatherData(){
        if(Location.instance.locationProvided){
        WeatherService.instance.downloadWeatherDetails {
            self.statusItem.button?.title = "\(WeatherService.instance.currentWeather.currentTemp)°"
            
            WeatherService.instance.downloadForecast(compleated:  {
                NotificationCenter.default.post(name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
                //print("data downloaded")
                //self.locationManager.stopUpdatingLocation()
            }) 
        }
        } else {
            print("No location provided")
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func displayPopUp(_ sender: AnyObject?){
        let storyBoard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        guard let vc = storyBoard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "WeatherVC")) as? NSViewController else { return }
        let popOverView = NSPopover()
        popOverView.contentViewController = vc
        popOverView.behavior = .transient
        popOverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .minY)
    }

}


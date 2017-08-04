//
//  AppDelegate.swift
//  weathered
//
//  Created by dubie on 7/21/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    //varibles
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem.button?.title = "--°"
        statusItem.action = #selector(AppDelegate.displayPopUp(_:))
        
        WeatherService.instance.downloadWeatherDetails()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func displayPopUp(_ sender: AnyObject?){
        let storyBoard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateController(withIdentifier: "WeatherVC") as? NSViewController else { return }
        let popOverView = NSPopover()
        popOverView.contentViewController = vc
        popOverView.behavior = .transient
        popOverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .minY)
    }

}


//
//  WeatherCell.swift
//  weathered
//
//  Created by dubie on 8/3/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Cocoa

class WeatherCell: NSCollectionViewItem {
    
    //Outlets
    @IBOutlet weak var weatherImg: NSImageView!
    @IBOutlet weak var dateLbl: NSTextField!
    @IBOutlet weak var highTempLbl: NSTextField!
    @IBOutlet weak var lowTempLbl: NSTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = CGColor(red: 0.69, green: 0.85, blue: 0.99, alpha: 0.5)
        self.view.layer?.cornerRadius = 5
    }
    
    func configureCell(weatherCell: Forcast){
        weatherImg.image = NSImage(named: NSImage.Name(rawValue: weatherCell.weatherType))
        highTempLbl.stringValue = "\(weatherCell.highTemp)"
        lowTempLbl.stringValue = "\(weatherCell.lowTemp)"
        dateLbl.stringValue = weatherCell.date
    }
    
}

//
//  WeatherVC.swift
//  weathered
//
//  Created by dubie on 7/21/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Cocoa
import Alamofire

class WeatherVC: NSViewController {

    //outlets
    @IBOutlet weak var dateLbl: NSTextField!
    @IBOutlet weak var tempLbl: NSTextField!
    @IBOutlet weak var locationLbl: NSTextField!
    @IBOutlet weak var weatherImage: NSImageView!
    @IBOutlet weak var weatherConditionLbl: NSTextField!
    @IBOutlet weak var collectionView: NSCollectionView!
    @IBOutlet weak var poweredByBtn: NSButton!
    @IBOutlet weak var quitBtn: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidAppear() {
        updateUI()
        NotificationCenter.default.addObserver(self, selector: #selector(WeatherVC.dataDownloadedNotif(_:)), name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
        
        self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.0)
        //updateUI()
        quitBtn.styleButtonText(button: quitBtn, buttonName: "Quit", fontColor: .darkGray, alignment: .center, font: "Avenir Next", size: 11)
        poweredByBtn.styleButtonText(button: poweredByBtn, buttonName: "Powered by OpenWeatherMap", fontColor: .darkGray, alignment: .center, font: "Avenir Next", size: 11)
    }
    
    override func viewDidDisappear() {
        NotificationCenter.default.removeObserver(self, name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
    }
    
    func dataDownloadedNotif(_ notif: Notification){
        updateUI()
        //print("notification to update UI")
    }
    
    @IBAction func poweredByBtnClicked(_ sender: Any) {
        let url = URL(string: API_HOMEPAGE)
        NSWorkspace.shared().open(url!)
    }
    
    @IBAction func quitBtnClicked(_ sender: Any) {
        NSApplication.shared().terminate(nil)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func updateUI(){
        
        let location = Location.instance
        if !location.locationProvided {
            return
        }
    
        let weather = WeatherService.instance.currentWeather
        dateLbl.stringValue = weather.date
        tempLbl.stringValue = "\(weather.currentTemp)°"
        locationLbl.stringValue = weather.cityName
        weatherConditionLbl.stringValue = weather.weatherType
        weatherImage.image = NSImage(named: weather.weatherType)
        collectionView.reloadData()
        print("UI Updated")
        
    }


}

extension WeatherVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem{
        let forcastItem = collectionView.makeItem(withIdentifier: "WeatherCell", for: indexPath)
        
        guard let forcastCell = forcastItem as? WeatherCell else {
            return forcastItem
        }
        forcastCell.configureCell(weatherCell: WeatherService.instance.forcast[indexPath.item])
        
        return forcastItem
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeatherService.instance.forcast.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 125, height: 125)
    }
}


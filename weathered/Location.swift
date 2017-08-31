//
//  Location.swift
//  weathered
//
//  Created by dubie on 8/23/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Foundation

class Location {
    
    static var instance = Location()
    
    fileprivate var _latitude: Double?
    fileprivate var _longitude: Double?
    fileprivate var _zip: Int?
    fileprivate var _UseZip = false
    
    var latitude: Double{
        get{
            if (_latitude == nil){
                return 0.00
            } else{
              return _latitude!
            }
            
        } set {
            _latitude = newValue
        }
    }
    
    var longitude: Double{
        get{
            if (_longitude == nil){
                return 0.00
            } else{
                return _longitude!
            }
        } set {
            _longitude = newValue
        }
    }

}

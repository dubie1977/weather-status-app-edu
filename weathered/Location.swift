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
    fileprivate var _useZip = false
    fileprivate var _locationProvided = false
    
    var latitude: Double{
        get{
            if let lat = _latitude{
                return lat
            } else{
              return 0.00
            }
            
        } set {
            _latitude = newValue
        }
    }
    
    var longitude: Double{
        get{
            if let long = _longitude{
                return long
            } else{
                return 0.00
            }
        } set {
            _longitude = newValue
        }
    }
    
    var zip: Int{
        get{
            if let zip = _zip {
                return zip
            } else {
                return 0
            }
        } set {
            _zip = newValue
        }
    }
    
    var useZip: Bool{
        get{
            return _useZip
        } set {
            _useZip = newValue
        }
    }
    
    var locationProvided: Bool {
        get{
            if _useZip {
                if let _ = _zip {
                    _locationProvided = true
                } else {
                    _locationProvided = false
                }
            } else {
                if let _ = _longitude , let _ = _latitude {
                    _locationProvided = true
                } else {
                    _locationProvided = false
                }
            }
            
            return _locationProvided
        } set {
            _locationProvided = newValue
        }
    }

}

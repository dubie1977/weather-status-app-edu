//
//  NSDate.swift
//  weathered
//
//  Created by Joseph DuBay on 8/15/17.
//  Copyright © 2017 dubay. All rights reserved.
//

import Foundation

extension Date {
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
}

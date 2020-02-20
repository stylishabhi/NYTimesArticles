//
//  Utility.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
//import Reachability

enum DateFormats: String {
    case ddMMMyy
    case ddMMyyyy        = "dd/MM/yyyy"
    case HHmm
    case MMddyyyy        = "MM/dd/yyyy"
    case EEEddMMM        = "EEE dd MMM"
    case yyyyMMddTHHmmss = "yyyy-MM-dd'T'HH:mm:ss"
    case yyyyMMddHHmmss  = "yyyy-MM-dd HH:mm:ss"
    case yyyyMMddHHmm    = "yyyy-MM-dd HH:mm"
    case yyyy_MM_dd      = "yyyy-MM-dd"
    case yyyyMMdd        = "yyyyMMdd"
}

class Utility {
    
    static func getDateFromString(dateString:String) -> NSDate? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.yyyy_MM_dd .rawValue
        guard let date = dateFormatter.date(from:dateString) else {
            NSLog("Date conversion failed due to mismatched format.")
            return NSDate()
        }
        return date as NSDate
    }
    
    static func getStringFromDate(date:Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.yyyy_MM_dd .rawValue
        let newDate = dateFormatter.string(from: date)
        return newDate
    }
    
    /*static func isConnectedToNetwork() -> Bool {
        return (Reachability()?.connection != .none)
    }*/
    
}

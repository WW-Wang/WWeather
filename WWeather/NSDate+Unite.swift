//
//  NSDate+Unite.swift
//  WWeather
//
//  Created by zh.wang on 15/8/29.
//  Copyright (c) 2015年 WW_Wang. All rights reserved.
//

import Foundation

let DateFormatter: String = "yyyy年MM月dd日 HH时mm分"

extension NSDate {
    
    class func stringFromInputDate(date: NSDate) -> NSString {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = DateFormatter
        let dateString: NSString? = dateFormatter.stringFromDate(date)
        return dateString!
    }
    
}
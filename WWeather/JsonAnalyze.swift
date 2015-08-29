//
//  JsonAnalyze.swift
//  WWeather
//
//  Created by zh.wang on 15/8/29.
//  Copyright (c) 2015年 WW_Wang. All rights reserved.
//

import Foundation

extension NSArray {
    
    func JSONString() -> NSString? {
        var error: NSError?
        var jsonData: NSData = NSJSONSerialization.dataWithJSONObject(self, options: NSJSONWritingOptions.PrettyPrinted, error: &error)!
        if (error != nil) {
            NSLog("NSArray JSONString error: %@", error.debugDescription)
            return nil
        } else {
            return NSString(data: jsonData, encoding: NSUTF8StringEncoding)!
        }
    }
    
}

// ----------------------------------------------------------------------------- //

extension NSDictionary {
    
    func JSONString() -> NSString? {
        var error: NSError?
        var jsonData: NSData = NSJSONSerialization.dataWithJSONObject(self, options: NSJSONWritingOptions.PrettyPrinted, error: &error)!
        if (error != nil) {
            NSLog("NSArray JSONString error: %@", error.debugDescription)
            return nil
        } else {
            return NSString(data: jsonData, encoding: NSUTF8StringEncoding)!
        }
    }
    
}

// ----------------------------------------------------------------------------- //

extension NSString {
    
    func objectFromJSONString() -> AnyObject? {
        var error: NSError?
        var object: AnyObject? = NSJSONSerialization.JSONObjectWithData(self.dataUsingEncoding(NSUTF8StringEncoding)!, options: nil, error: &error)
        if (error != nil) {
            NSLog("NSString JSONString error: %@", error.debugDescription)
            return nil
        }
        return object!;
    }
}

// ----------------------------------------------------------------------------- //

extension NSData {
    
    func objectFromJSONString() -> AnyObject? {
        var error: NSError?
        var object: AnyObject? = NSJSONSerialization.JSONObjectWithData(self, options: nil, error: &error)
        if (error != nil) {
            NSLog("NSData JSONString error: %@", error.debugDescription)
            return nil
        }
        return object
    }
    
}

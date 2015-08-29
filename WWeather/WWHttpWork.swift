//
//  WWHttpWork.swift
//  WWeather
//
//  Created by zh.wang on 15/8/27.
//  Copyright (c) 2015年 WW_Wang. All rights reserved.
//

import UIKit

enum WWTemperature {
    case WWTempKelvin
    case WWTempCelcius
    case WWTempFahrenheit
}

class WWHttpWork: NSObject {
    
    private var baseURL: NSString!
    private var apiKey: NSString!
    private var apiVersion: NSString!
    
    private var currentTemperatureFormat: WWTemperature?
    
    override init() {
        super.init()
        baseURL = "http://api.openweathermap.org/data/"
        apiVersion = "2.5"
        currentTemperatureFormat = WWTemperature.WWTempCelcius
        apiKey = queryApiKey()
    }
    
    func queryApiKey() -> NSString {
        var plistPath: NSString = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")!
        var dic: NSDictionary = NSMutableDictionary(contentsOfFile: plistPath as String)!
        return dic.objectForKey("ApiKey") as! String
    }
    
    func queryCurrentWeather(city: NSString, callBack: (error: NSError, result: NSDictionary) -> ()) {
        var method: NSString = NSString(format: "weather?q=%@,cn", city)
        callMethodWithBlock(method, callBack: callBack)
    }
    
    private func callMethodWithBlock(method: NSString, callBack: (error: NSError, result: NSDictionary) -> ()) {
        let urlString:NSString = "\(baseURL)\(apiVersion)/\(method)&APPID=\(apiKey)&units=metric"
        NSLog("URL: %@", urlString)
        let manager = AFHTTPRequestOperationManager()
        manager.GET(urlString as String, parameters: nil, success: { (operation, responseObject) in
                let dic: NSDictionary = responseObject as! NSDictionary
                NSLog("Result Json : %@", dic.JSONString()!)
            }, failure: { (operation, error) in
                NSLog("Error: %@", error.localizedDescription)
        })
    }
}

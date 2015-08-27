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
    
    required init(apiKey: NSString) {
        baseURL = "http://api.openweathermap.org/data/"
        apiVersion = "2.5"
        self.apiKey = apiKey
        currentTemperatureFormat = WWTemperature.WWTempCelcius
    }
    
    
    func callMethodWithBlock(method: NSString, callBack: (error: NSError, result: NSDictionary) -> ()) {
        let urlString:NSString = "\(baseURL)\(apiVersion)/\(method)&APPID=\(apiKey)&units=metric&lang=zh_cn"
        let manager = AFHTTPRequestOperationManager()
        manager.GET(urlString as String, parameters: nil, success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                println("JSON: " + responseObject.description!)
            }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("Error: " + error.localizedDescription)
            })
    }
}

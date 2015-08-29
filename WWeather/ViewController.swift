//
//  ViewController.swift
//  WWeather
//
//  Created by zh.wang on 15/8/27.
//  Copyright (c) 2015年 WW_Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _httpWorking = WWHttpWork()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queryCurrentWeather("jinhua")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func queryCurrentWeather(city: NSString) {
        _httpWorking.queryCurrentWeather("jinhua", callBack: { (error: NSError, result: NSDictionary) -> () in
            
        })
    }
}


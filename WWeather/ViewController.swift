//
//  ViewController.swift
//  WWeather
//
//  Created by zh.wang on 15/8/27.
//  Copyright (c) 2015年 WW_Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _httpWorking = WWHttpWork(apiKey: "ba702e365af74f316891b57d7211c0d0");
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getJson(sender: UIButton) {
        _httpWorking.callMethodWithBlock("weather?q=jinhua,cn", callBack: { (error: NSError, result: NSDictionary) -> () in
            
        })
    }
}


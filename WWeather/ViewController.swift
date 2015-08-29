//
//  ViewController.swift
//  WWeather
//
//  Created by zh.wang on 15/8/27.
//  Copyright (c) 2015年 WW_Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var updateTimeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var _httpWorking = WWHttpWork()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queryCurrentWeather("jinhua")
        
        self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clearColor())
        // UIFont.fontNamesForFamilyName("Helvetica-Light"),NSFontAttributeName
        
        var titleTextAttributes = NSDictionary(object: UIFont(name: "Helvetica-Light", size: 18.0)!, forKey: NSFontAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes as [NSObject : AnyObject]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func queryCurrentWeather(city: NSString) {
        _httpWorking.queryCurrentWeather("jinhua", callBack: { (error: NSError?, result: NSDictionary?) -> () in
            if (error != nil) {
                return
            }
            self.updateLoadInterface(result!)
        })
    }
    
    func updateLoadInterface(result: NSDictionary) {
        let updateTimeInterval: AnyObject? = result.objectForKey("dt")
        var updateTime = NSDate(timeIntervalSince1970: updateTimeInterval as! Double)
        self.updateTimeLabel.text = NSDate.stringFromInputDate(updateTime) as String
        
        let temp: AnyObject? = (result.objectForKey("main") as! NSDictionary).objectForKey("temp")
        self.temperatureLabel.text = NSString(format: "%.0f", temp as! Double) as? String
    }
}


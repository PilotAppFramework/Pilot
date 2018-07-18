//
//  Facade.swift
//  App
//
//  Created by LXF on 2018/7/15.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit
import FastComponent

class Facade {
    public static var shared:Facade!
    public var cachePool:[String:Any] = [:]
    public var singletonPool:[String:Any] = [:]
    
}

extension Facade{
    public static func initFacade(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?){
        shared = Facade.init()
        
        
    }
}






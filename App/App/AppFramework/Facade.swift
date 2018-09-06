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
    
    internal var _log:XXLoger!
    
    /// 缓存池
    public var cachePool:[String:Any] = [:]
    
    /// 单例缓存池
    public var singletonPool:[String:Any] = [:]
    
    /// 启动参数
    public var application: UIApplication!
    public var launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    
    /// 重新初始化
    public func reInit(){
        Facade.initFacade(application, didFinishLaunchingWithOptions: launchOptions)
    }

}

extension Facade{
    public static func initFacade(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?){
        shared = Facade.init()
        shared.application = application
        shared.launchOptions = launchOptions
        shared._log = XXLoger.init()
        
    }
}






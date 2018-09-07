//
//  AppDelegate.swift
//
//  Created by Rdxer on 2017/12/6.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import Device
import FastComponent

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Facade.initFacade(application, didFinishLaunchingWithOptions: launchOptions)
        
        // 强制注册
        _ = Facade.shared.singleton(type: AppMainDB.self)
        
        initWindow()
        initHUD()
        
        
//        _ = Facade.shared.singleton(type: AppUserDB.self,maps: "{\"uid\":\"1\"}")
//        _ = Facade.shared.singleton(type: AppUserDB.self,maps: "{\"uid\":\"2\"}")
        
        return true
    }
}

extension AppDelegate{
    func initWindow() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = AppRoutes.shared.lauchAutoChooseVC()
        window?.makeKeyAndVisible()
    }
    
    public static var sheared:AppDelegate?{
        return UIApplication.shared.delegate as? AppDelegate
    }
}




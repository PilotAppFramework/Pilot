//
//  AppRoutes.swift
//  APP
//
//  Created by Rdxer on 2017/12/8.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

class AppRoutes: NSObject {
    
    public static let shared = AppRoutes.init()
    
    private override init() {}
    
    public func lauchAutoChooseVC() -> UIViewController{
        
        
        
//        guard AuthManager.shared.isLogin else{
//            return  LoginViewController.init()
//        }
        
#if DEBUG

#else
    
//        guard AccountManager.shared.isVerificationSMSCode else{
//            return  SMSVerificationViewController.smsVVC_NAV()
//        }
    
 #endif
        
        
//        return MainTabBarController.init()
        return UIViewController.init()
    }
    
}


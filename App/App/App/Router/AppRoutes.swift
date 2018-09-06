//
//  AppRoutes.swift
//  APP
//
//  Created by Rdxer on 2017/12/8.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

/// 切换 rootWindows 的操作都放这里
class AppRoutes: NSObject {
    
    public static let shared = AppRoutes.init()
    
    private override init() {}
    
    /// 启动之后自动
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
        return LoginViewController.init()
    }
}


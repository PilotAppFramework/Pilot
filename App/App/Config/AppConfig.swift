//
//  Config.swift
//  App
//
//  Created by LXF on 2018/7/17.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation


class AppConfig:NSObject{
    
    ///
    public var host:String = Env.URL
    
    /// 默认 配置
    public static var shared:AppConfig!
    
}

//
//  AppColor.swift
//  App
//
//  Created by LXF on 2018/9/6.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit


var AC = AppColor.current


class AppColor:NSObject {
    
    public static var current = AppColor.init()
    
    public let mainColor:UIColor = UIColor.init("#c7000b")!
    
    public let backgroundColor:UIColor = UIColor.init("#F5F5F5")!
    
    public let backgroundIndexColor:UIColor = UIColor.init("#F8F8F8")!
    
    /// 灰白
    public let white_ashen = UIColor.init("#EEEEEE")
    
    public let white = UIColor.white
    public let clear = UIColor.clear
    
    /// 深色 text  333333
    public let textColor:UIColor = UIColor.init("#333333")!
    
    /// 浅色 text 999999
    public let lightTextColor:UIColor = UIColor.init("#999999")!
    
    /// 浅色2  bfbfbf  - 更浅
    public let lightText2Color:UIColor = UIColor.init("#bfbfbf")!
    
    /// 浅色分割线  #dddddd
    public let grayDividerColor:UIColor = UIColor.init("#dddddd")!
    
}

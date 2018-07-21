//
//  ServerConfig.swift
//  APP
//
//  Created by Rdxer on 2017/12/6.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import Device

struct NetConfig {
    // MARK: - 配置信息
    // url
    public static var baseURLString:String{
        return Env.URL
    }
    
    // token
    public static var token:String? = nil{
        didSet{
            Loger.w("刷新了 Token:>>>> \(token ?? "空的")")
        }
    }
    
    public static var page_size:Int = Env.API.PAGE_SIZE
    
    public static var tails = "\(Device.version()),\(UIDevice.current.systemName)\(UIDevice.current.systemVersion)"
    
    private init() {}
}

/// 拼接 参数
extension Dictionary {
    public var appendToken:[String : Any]{
        var dict:[String:Any] = self as! [String : Any]
        if let token = NetConfig.token {
            dict["token"] = token
        }
        return dict
    }
    
    public var appendPageSize:[String : Any]{
        var dict:[String:Any] = self as! [String : Any]
        dict["size"] = NetConfig.page_size
        return dict
    }
}







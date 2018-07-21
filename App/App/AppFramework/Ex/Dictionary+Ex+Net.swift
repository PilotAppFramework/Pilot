//
//  Dict+Ex+Net.swift
//  App
//
//  Created by LXF on 2018/7/21.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation


/// 拼接 参数
extension Dictionary {
    
    /// 构建一个 值不为空的 字典,为空 剔除
    public func makeNotNilValueDict()->[String:Any]{
        var para:[String:Any] = [:]
        
        for (k,v) in self {
            para = para.appendIfNotNil(key: (k as? String) ?? String.init(describing: k), value: v)
        }
        
        return para
    }
    
    /// put 非空值 为 nil 不 put
    public func appendIfNotNil(key:String?,value:Any?)->[String : Any]{
        if let key = key,let value = value,var dict = self as? [String : Any] {
            dict[key] = value
            return dict
        }
        return (self as? [String : Any]) ?? [:]
    }
}

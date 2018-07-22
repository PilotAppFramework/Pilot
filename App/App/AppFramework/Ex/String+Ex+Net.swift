//
//  String+Ex+Net.swift
//  App
//
//  Created by LXF on 2018/7/21.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation

extension String{
    /// 拼接
    public func appendIfNotNil(prdfix:String? = nil,value:Any?,suffix:String? = nil)->String{
        var res = self
        if let va = value {
            if let p = prdfix?.nilOrNotEmptyString{
                res += p
            }
            res += String.init(describing: va)
            if let s = suffix?.nilOrNotEmptyString{
                res += s
            }
        }
        return res
    }
}

extension String {
    public var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    public var urlAndEscaped: String {
        let res = self.split(separator: "&").joined(separator: "%26")
        return res
    }
}


//
//  SingletonProtoc.swift
//  App
//
//  Created by LXF on 2018/7/18.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation
import HandyJSON

protocol SingletonProtocol:HandyJSON {
    var maps:String?{ get set}
    func didInit(facade:Facade)
    func willDeinit(facade:Facade)
    func donNeedInitialized(maps:String)->Bool
}


extension SingletonProtocol{
    
    public func donNeedInitialized(maps:String)->Bool{
        if maps == self.maps {
            return true
        }
        return false
    }

}


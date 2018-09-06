//
//  Facade+Singleton.swift
//  App
//
//  Created by LXF on 2018/7/18.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation


extension Facade{
    /**
     获取该对象的单例
    */
    public func singleton<T:SingletonProtocol>(type: T.Type,maps:String = "{}")->T{
        
        let id = String(describing: type)
        
        if let si = singletonPool[id] as? T{
            
            if si.donNeedInitialized(maps: maps){
                return si
            }
            
            si.willDeinit(facade: self)
            
        }
        
        
        
        var t = T.deserialize(from: maps)
        
        t?.maps = maps
        
        t?.didInit(facade: self)
        
        singletonPool[id] = t
        
        return t!;
    }
    
    
    
    
}

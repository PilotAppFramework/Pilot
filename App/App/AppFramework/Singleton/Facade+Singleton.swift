//
//  Facade+Singleton.swift
//  App
//
//  Created by LXF on 2018/7/18.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation


extension Facade{
    public func singleton<T:SingletonProtocol>(type: T.Type)->T{
        let id = String(describing: type)
        
        if let si = singletonPool[id] as? T{
            return si
        }
        
        let t = T.deserialize(from: "{}")
        
        singletonPool[id] = t
        
        return t!;
    }
}

//
//  HandyJSON+SwiftyUserDefaults.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/11.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import HandyJSON
import SwiftyUserDefaults

/// 统一 HandyJSON + SwiftyUserDefaults


public extension UserDefaults {
    public func getModel<T:HandyJSON>(key: DefaultsKey<T?>)->T?{
        return T.deserialize(from: string(forKey: key._key))
    }
    public func setModel<T:HandyJSON>(key: DefaultsKey<T?>,value:T?){
        set(key, value?.toJSONString())
    }
}

public extension UserDefaults {
    public func getModelList<T:HandyJSON>(key: DefaultsKey<[T]?>)->[T?]?{
        return JSONDeserializer<T>.deserializeModelArrayFrom(json: string(forKey: key._key))
    }
    public func setModelList<T:HandyJSON>(key: DefaultsKey<[T]?>,value:[T]?){
        set(key, value?.toJSONString())
    }
}


//extension UserDefaults {

//    public subscript<T:Hand>(key: DefaultsKey<HandyJSON?>,clazz:AnyClass) -> HandyJSON? {
//        get {
//            let clazz = clazz as? HandyJSON.Type
//            return clazz?.deserialize(from: string(forKey: key._key))
//        }
//        set {
//            set(key, newValue?.toJSONString())
//        }
//    }
//}

//// array
//extension UserDefaults {
//    public subscript(key: DefaultsKey<[HandyJSON]?>,clazz:HandyJSON.Type) -> [HandyJSON]? {
//        get {
//            return JSONDeserializer.deserializeModelArrayFrom(json: json, designatedPath: designatedPath)
////            return clazz.deserialize(from: string(forKey: key._key))
//        }
//        set {
//            set(key, newValue)
//        }
//    }
//
//    public subscript(key: DefaultsKey<[Any]>) -> [Any] {
//        get { return array(forKey: key._key) ?? [] }
//        set { set(key, newValue) }
//    }
//}

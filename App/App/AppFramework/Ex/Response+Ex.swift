//
//  map.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import HandyJSON


extension Response {
    /// response to one Model
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String.init(data: data, encoding: .utf8)
        if let res = JSONDeserializer<T>.deserializeFrom(json: jsonString){
            return res
        }
        throw MoyaError.objectMapping(NSError.init(domain: "解析为对象失败", code: -1, userInfo: ["msg":"解析为对象失败"]), self)
    }
    
    /// 取 key 的值转化为 model  默认key 为 "data"
    func mapModelWithKey<T: HandyJSON>(_ type: T.Type,key:String = "data") -> T? {
        let jsonObject = try? JSONSerialization.jsonObject(with:data, options: .allowFragments)
        
        let jsonDict = jsonObject as? [String:NSDictionary]
        
        let value = jsonDict?[key]
        
        return JSONDeserializer<T>.deserializeFrom(dict: value)
    }
    
    /// NSDictionary Response first value to a Model
    func mapSingleModel<T: HandyJSON>(_ type: T.Type) -> T? {
        let jsonObject = try? JSONSerialization.jsonObject(with:data, options: .allowFragments)
        let jsonDict = jsonObject as? [String:NSDictionary]
        let value = jsonDict?.first?.value
        return JSONDeserializer<T>.deserializeFrom(dict: value)
    }
    
    /// NSDictionary Response key "data" value to a Model List
    func mapModelList<T: HandyJSON>(_ type: T.Type) throws -> [T?] {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with:data, options: .allowFragments)
            let jsonDict = jsonObject as? [String:Any]
            guard let data = jsonDict?["data"] as? NSArray else{
                throw MoyaError.objectMapping(NSError.init(domain: "key(data)不存在", code: -2, userInfo: ["msg":"key(data)不存在,解析为对象数组失败"]), self)
            }
            return JSONDeserializer<T>.deserializeModelArrayFrom(array: data) ?? []
        } catch  {
            throw MoyaError.jsonMapping(self)
        }
    }
}






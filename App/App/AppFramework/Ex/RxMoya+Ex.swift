//
//  RxSwift+RxMoyaEx.swift
//  APP
//
//  Created by Rdxer on 2017/12/8.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxCocoa
import HandyJSON


extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    /// 整个Response转化为一个模型
    public func mapModel<T: HandyJSON>(_ type: T.Type) -> Single<T> {
        return flatMap { response -> Single<T> in
            return Single.just(try response.mapModel(type))
        }
    }
    
    /// 整个Response字典取 key 的 value 转化为一个模型  key 默认为 data
    public func mapModelWithKey<T: HandyJSON>(_ type: T.Type,key:String = "data") -> Single<T?> {
        return flatMap { response -> Single<T?> in
            return Single.just(response.mapModelWithKey(type, key: key))
        }
    }
    
    /// 整个Response字典取第一个value转化为一个模型
    public func mapModelWithFirstValue<T: HandyJSON>(_ type: T.Type) -> Single<T?> {
        return flatMap { response -> Single<T?> in
            return Single.just(response.mapSingleModel(type))
        }
    }
    
    /// 整个Response字典取"data"的值转化为一个模型List
    public func mapModelListWithDataValue<T: HandyJSON>(_ type: T.Type) -> Single<[T?]> {
        return flatMap { response -> Single<[T?]> in
            return Single.just(try response.mapModelList(T.self))
        }
    }
    
    /// 整个Response字典取"data"的值转化为一个模型List 然后取第一个  mapModelListWithDataValueFirstModel
    /// 整个Response字典取第一个value转化为一个模型
    public func mapModelListWithDataValueFirstModel<T: HandyJSON>(_ type: T.Type) -> Single<T?> {
        return flatMap { response -> Single<T?> in
            if let first = try response.mapModelList(T.self).first{
                return Single.just(first)
            }
            return Single.just(nil)
        }
    }
}


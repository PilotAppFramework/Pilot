//
//  UserApi.swift
//  APP
//
//  Created by Rdxer on 2017/12/8.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import FastComponent
import Moya
import CryptoSwift
import Device

/// 用户相关的
public enum AuthApi {
    /// 登陆
    case auth(
        userName:String,
        password:String
    )
}

extension AuthApi:TargetType{
    
    public var authorizationType: AuthorizationType{
        switch self {
            case .auth: return AuthorizationType.none
        }
    }
    
    public var baseURL: URL {
        return try! NetConfig.baseURLString.asURL()
    }
    
    public var path: String {
        switch self {
        case .auth: return "oauth/token"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .post
        }
    }
    
    public var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    public var task: Task {
        switch self {
            default:
//                return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
                return Task.requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var parameters: [String: Any]{
        switch self {
        case .auth(let userName, let password):
            return [
                "username":userName,
                "password":password,
            ]
//            default: return [:];
        }
    }
    
}

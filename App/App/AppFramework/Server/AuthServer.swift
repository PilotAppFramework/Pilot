//
//  AccountManager.swift
//  APP
//
//  Created by Rdxer on 2017/12/9.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyUserDefaults

public protocol AuthData: HandyJSON {
    func valid()->Bool
}

/*
 
 原先设置好 解析模型 即可
 
 func initAuthServer(){
     AuthServer.modelParser = {
        return TokenData.deserialize(from: $0)
     }
 }
 
 extension AuthServer{
     var tokenData:TokenData?{
        return authData() as? TokenData
     }
 }
 
 */

public class AuthServer: SingletonProtocol {
    var maps: String?
    
    func didInit(facade: Facade) {
        
    }
    
    func willDeinit(facade: Facade) {
        
    }
    
    public static var modelParser:((String)->(AuthData?))?
    
    public var default_key = "AuthServer.AuthData"
    
    private var _authData:AuthData?
    
    open func setAuthData(authData:AuthData?){
        if let authData = authData {
            Defaults[default_key] = authData.toJSONString()
        }else{
            Defaults.remove(default_key)
        }
        _authData = authData
    }
    
    open func save(){
        setAuthData(authData: authData())
    }
    
    open func authData()->AuthData?{
        if _authData == nil {
            if let modelJson = Defaults.string(forKey: default_key){
                _authData = AuthServer.modelParser?(modelJson)
            }
        }
        return _authData
    }
    
    required public init() {}
    
    public var isLogin:Bool{
        return authData()?.valid() ?? false
    }
    
    public func login<T: AuthData>(authData data:T) {
        logout()
        if data.valid() {
            Defaults[default_key] = data.toJSONString()
            setAuthData(authData: data)
        }
    }
    
    public func logout(){
        setAuthData(authData: nil)
    }
}

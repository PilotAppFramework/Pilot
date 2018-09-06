//
//  User.swift
//  App
//
//  Created by LXF on 2018/9/6.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit
import HandyJSON



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


///
class TokenData: NSObject ,AuthData {
    func valid() -> Bool {
        return token?.nilOrNotEmptyString != nil
    }
    
    override required public init() {}
    var token:String?
    var aaa:String?
}

// MARK: -
// MARK: - json
/*
 
 <#JSON#>
 
 */

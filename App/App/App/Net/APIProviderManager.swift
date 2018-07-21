//
//  APIProviderManager
//  APP
//
//  Created by Rdxer on 2017/12/11.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import FastComponent

public class AppProviderManager{
    
    static let moyaNetworkActivityPlugin = NetworkActivityPlugin.init(networkActivityClosure: { (type, target) in
        switch type {
        case .began:
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        case .ended:
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    })
    
#if DEBUG
    /// DEBUG 才需要  NetworkLoggerPlugin
    static let pluginList:[PluginType] = [
        NetworkLoggerPlugin.init(verbose: true, cURL: true, output: nil, requestDataFormatter: nil, responseDataFormatter: nil),
        moyaNetworkActivityPlugin,
//        OAccessTokenPlugin.init(tokenClosure: {
//            return (AuthManager.shared.authData() as? TokenData)?.access_token ?? ""
//        }),
//        AcceptPlugin.init()
    ]
#else
    static let pluginList:[PluginType] = [
        moyaNetworkActivityPlugin,
//        OAccessTokenPlugin.init(tokenClosure: {
//            return (AuthManager.shared.authData() as? TokenData)?.access_token ?? ""
//        }),
//        AcceptPlugin.init()
    ]
#endif
    
    static func makeProvider<T: TargetType>() -> MoyaProvider<T> {
        let provider = MoyaProvider<T>(endpointClosure: MoyaProvider.defaultEndpointMapping, requestClosure: MoyaProvider<T>.defaultRequestMapping, stubClosure: MoyaProvider.neverStub, manager: MoyaProvider<T>.defaultAlamofireManager(), plugins: pluginList, trackInflights: false)
        return provider
    }
}

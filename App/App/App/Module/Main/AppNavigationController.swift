//
//  AppNavigationController.swift
//  App
//
//  Created by LXF on 2018/9/6.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit
import FastComponent
import Moya


public class AppNavigationController: XXAppNavigationController {
    
}



public extension XXExtension where Base:UIViewController {
    public func wrapNavigation()->AppNavigationController{
        let nav = AppNavigationController.init(rootViewController: self.base)

        let button = UIButton.init(type: .custom)
        button.image = FastComponentBundle.imageWithSelf(name: "close")
        let ba = self.base
        button.rx.tap.subscribe { [weak ba](_) in
            ba?.dismiss(animated: true, completion: nil)
            }.disposed(by: button)

        let closeBarButton = UIBarButtonItem.init(customView: button)

        base.navigationItem.leftBarButtonItem = closeBarButton

        return nav
    }
}


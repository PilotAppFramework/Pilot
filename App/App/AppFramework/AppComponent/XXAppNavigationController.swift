//
//  XXNavigationController.swift
//  APP
//
//  Created by Rdxer on 2017/12/9.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import Async
import RxSwift
import RxCocoa
import FastComponent

/// 自定义 左侧返回图标之后仍然能侧滑的 NVC
public class XXAppNavigationController: XXBaseNavigationController,UIGestureRecognizerDelegate {

    open override  func viewDidLoad() {
        super.viewDidLoad()
        prepareGestureRecognizerDelegate()
        navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor:AC.textColor
        ]
    }

    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {

        if self.viewControllers.count > 0 {
            
            let image =  FastComponentBundle.imageWithSelf(name: "nav_bar_back_icon")
            let barButton = UIBarButtonItem.init(image: image, style: .done, target: self, action: #selector(backButtonClick))
            viewController.navigationItem.leftBarButtonItem = barButton
            viewController.hidesBottomBarWhenPushed = true
        }

        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func backButtonClick(){
        self.popViewController(animated: true)
    }
    
    open func prepareGestureRecognizerDelegate(){
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count > 1 {
            return true
        }
        return false
    }
    open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return gestureRecognizer.isKind(of: UIScreenEdgePanGestureRecognizer.self)
    }
}


//public extension XXExtension where Base:UIViewController {
//    public func wrapNavigation()->XXAppNavigationController{
//        let nav = XXAppNavigationController.init(rootViewController: self.base)
//        
//        let button = UIButton.init(type: .custom)
//        button.image = FastComponentBundle.imageWithSelf(name: "close")
//        let ba = self.base
//        button.rx.tap.subscribe { [weak ba](_) in
//            ba?.dismiss(animated: true, completion: nil)
//            }.disposed(by: button)
//        
//        let closeBarButton = UIBarButtonItem.init(customView: button)
//        
//        base.navigationItem.leftBarButtonItem = closeBarButton
//        
//        return nav
//    }
//}

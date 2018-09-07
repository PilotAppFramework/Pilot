//
//  RxSwift+UIKit.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/14.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIResponder {
    
    public func isFirstResponder(isInvert:Bool = false)-> Binder<Bool> {
        return Binder(self.base) { responder, value in
            if isInvert ? !value : value {
                responder.becomeFirstResponder()
            }else{
                responder.resignFirstResponder()
            }
        }
    }
}



extension Reactive where Base: UIControl {
    
///     Bindable sink for `enabled` property.
//    public var isEnabled: Binder<Bool> {
//        return Binder(self.base) { control, value in
//            control.isEnabled = value
//        }
//    }
}


extension Reactive where Base: UIButton {
    /*
        button isEnable与否的两种情况下对应的 backgroudColor
     */
    public func switchBgColor(enBG:UIColor,disBG:UIColor)-> Binder< Bool> {
        return Binder(self.base) { control, value in
            control.backgroundColor = value ? enBG : disBG
        }
    }
}

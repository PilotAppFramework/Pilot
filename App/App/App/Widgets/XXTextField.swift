//
//  XXTextField.swift
//  App
//
//  Created by LXF on 2018/9/7.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit
import FastComponent
import Localize_Swift

public extension XXExtension where Base:UITextField{
    public func setUserNameStyle(placeholder:String = "手机号",keyboardType:UIKeyboardType = .numberPad){
        base.placeholder = placeholder.localized()
        base.autocapitalizationType = .none
        base.returnKeyType = .next
        base.keyboardType = .namePhonePad
        base.autocorrectionType = .no
    }
    public func setPasswordStyle(placeholder:String = "密码"){
        base.placeholder = placeholder.localized()
        base.autocapitalizationType = .none
        base.returnKeyType = .join
        base.isSecureTextEntry = true
    }
    
    public func setLeftImage(image:UIImage,size:CGSize? = nil,s spacing:CGFloat? = nil){
        
        let leftImageView = UIImageView.init(image: image)
        
        let v = UIView.init(frame: leftImageView.frame)
        
        v.addSubview(leftImageView)
        
        var f = v.frame
        
        if let s = size {
            f.size = s
        }
        
        if let spa = spacing {
            f.size.width += spa
        }
        
        v.frame = f
        
        base.leftView = v
        
        base.leftViewMode = .always
    }
}

//
//  AppUIConstant.swift
//  APP
//
//  Created by LXF on 2018/1/5.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit

typealias AUIC = AppUIConstant

class AppUIConstant {
    
    /// 卡片的行高
    static let cardRowHeight:CGFloat = 44
    
    /// 卡片的圆角
    static let cardCornerRadius:CGFloat = 3
    
    /// 卡片的外边距
    static let cardMargin:CGFloat = 8
    
    static let cardMarginEdgeInsets:UIEdgeInsets = UIEdgeInsets.init(
        top: AppUIConstant.cardMargin/2,
        left: AppUIConstant.cardMargin,
        bottom: -AppUIConstant.cardMargin/2,
        right: -AppUIConstant.cardMargin)
    
    /// 卡片的内边距
    static let cardPadding:CGFloat = 10
    static let cardPaddingEdgeInsets:UIEdgeInsets = UIEdgeInsets.init(
        top: AppUIConstant.cardPadding,
        left: AppUIConstant.cardPadding,
        bottom: -AppUIConstant.cardPadding,
        right: -AppUIConstant.cardPadding)
    
    
    /// cell title size
    static let cellTitleSize:CGFloat = 16
    
    /// 1 17
    static let h1Size:CGFloat = 17
    /// 2 16
    static let h2Size:CGFloat = 16
    /// 3 15
    static let h3Size:CGFloat = 15
    /// 4 14
    static let h4Size:CGFloat = 14
    
}

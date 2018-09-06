//
//  XXBaseCardTableViewCell.swift
//  App
//
//  Created by LXF on 2018/9/6.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit


/// 卡片式的 TableViewCell 基类
public class XXBaseCardTableViewCell<TModel>: XXBaseTableViewCell<TModel> {
    
    /// 模型变更时调用   无需调用 super
    open override func modelDidSet(oldValue:TModel?,value:TModel?){}
    
    /// 准备 subview   !!! 需要调用 super  请使用 prepareCardSubViews
    open override func prepareSubViews(_ view: UIView){
        
        //        selectionStyle = .none
        
        backgroundColor = AC.backgroundColor
        
        view.addSubview(cardContainerView)
        
        view.xx.layoutVerticalSubviews(contentInset: AUIC.cardMarginEdgeInsets, fill: true)
        
        prepareCardSubViews(cardContainerView)
    }
    
    /// 准备 Card SubViews  无需调用 super
    open func prepareCardSubViews(_ view:UIView) {}
    
    let cardContainerView = UIView.init().then {
        $0.clipsToBoundsCornerRadius =  AUIC.cardCornerRadius
        $0.backgroundColor = AC.white
    }
}

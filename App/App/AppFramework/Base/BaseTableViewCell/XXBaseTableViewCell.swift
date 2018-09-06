//
//  XXBaseTableViewCell.swift
//  APP
//
//  Created by Rdxer on 2017/12/11.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

/// TableViewCell 基类
public class XXBaseTableViewCell<TModel>: UITableViewCell {
    
    var model:TModel?{
        didSet{
            modelDidSet(oldValue: oldValue, value: model)
        }
    }
    
    /// 模型变更时调用
    open func modelDidSet(oldValue:TModel?,value:TModel?){}
    
    /// 准备 subview 
    open func prepareSubViews(_ view:UIView){}
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareSubViews(contentView)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        prepareSubViews(contentView)
    }
}


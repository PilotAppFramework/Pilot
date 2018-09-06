//
//  XXBaseCollectionViewCell.swift
//  APP
//
//  Created by Rdxer on 2017/12/18.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

open class XXBaseCollectionViewCell<TModel>: UICollectionViewCell {
    
    var model:TModel?{
        didSet{
            modelDidSet(oldValue: oldValue, newValue: model)
        }
    }
    
    open func modelDidSet(oldValue:TModel?,newValue:TModel?){}
    
    open func prepareSubViews(){}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareSubViews()
    }
    
}

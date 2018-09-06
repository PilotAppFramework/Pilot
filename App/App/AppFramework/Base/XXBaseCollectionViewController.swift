//
//  XXBaseCollectionViewController.swift
//  APP
//
//  Created by Rdxer on 2017/12/9.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

class XXBaseCollectionViewController<T:UICollectionViewLayout>: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open var layout: T?
    
}

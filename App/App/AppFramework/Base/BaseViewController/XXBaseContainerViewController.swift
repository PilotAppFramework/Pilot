//
//  BaseContainerViewController.swift
//  APP
//
//  Created by LXF on 2018/1/10.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit
import FastComponent
import Moya


class XXBaseContainerViewController<VCType:UITableViewController>: XXBaseViewController {

    open var contentVC:VCType{
        if let vc = _contentVC {
            return vc
        }
        _contentVC = try! makeContentVC()
        return _contentVC!
    }
    
    open var _contentVC:VCType?
    
    open func makeContentVC() throws ->VCType{
        throw NSError.init(domain: "请重写此方法,返回子控制器", code: 0, userInfo: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareContentViewController()
        if title?.nilOrNotEmptyString == nil {
            if let t = contentVC.title?
                .nilOrNotEmptyString{
                title = t
            }
        }
    }
    
    open func prepareContentViewController(){
        
        addChildViewController(contentVC)
        
        view.addSubview(contentVC.view)
        contentVC.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

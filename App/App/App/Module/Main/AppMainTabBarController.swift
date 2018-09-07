//
//  MainTabBarController.swift
//  APP
//
//  Created by Rdxer on 2017/12/6.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import Then

class AppMainTabBarController: XXBaseTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = AC.mainColor
        
        prepareChildVC()
        
        view.tintColor = AC.textColor
    }
    
    
    var vcList:[(
        title:String,
        iconName_n:UIImage,
        iconName_h:UIImage,
        vc:UIViewController
        )] = [
            (title: "通知", iconName_n: #imageLiteral(resourceName: "menu_消息-g"), iconName_h: #imageLiteral(resourceName: "menu_消息-r"), vc: ClassGroupViewController.init()),
            (title: "组织", iconName_n: #imageLiteral(resourceName: "menu_通讯录-g"), iconName_h: #imageLiteral(resourceName: "menu_通讯录-r"), vc: DiscoveryViewController.init()),
            (title: "首页", iconName_n: #imageLiteral(resourceName: "menu_首页-g"), iconName_h: #imageLiteral(resourceName: "menu_首页-r"), vc: UIViewController.init()),
            (title: "审定", iconName_n: #imageLiteral(resourceName: "menu_审定-g"), iconName_h: #imageLiteral(resourceName: "menu_审定-r"), vc: BabyDiaryViewController.init()),
            (title: "我的", iconName_n: #imageLiteral(resourceName: "menu_我的-g"), iconName_h: #imageLiteral(resourceName: "menu_我的-r"), vc: MineViewController.init())
    ]
    
    func prepareChildVC(){
        for item in vcList {
            item.vc.tabBarItem.image = item.iconName_n
            item.vc.tabBarItem.selectedImage = item.iconName_h
            
            item.vc.title = item.title
            
            item.vc.tabBarItem.title = item.title
            
            let nvc = item.vc.xx.wrapNavigation()
            
            nvc.tabBarItem = item.vc.tabBarItem
            nvc.title = item.title
            
            addChildViewController(nvc)
        }
    }
}

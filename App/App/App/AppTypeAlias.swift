//
//  AppTypeAlias.swift
//  App
//
//  Created by LXF on 2018/7/16.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation
import SVProgressHUD

var log = Facade.shared.log
typealias  hud = SVProgressHUD

func initHUD() {
    hud.setDefaultStyle(.dark)
    hud.setMinimumSize(.init(width: 100, height: 80))
    hud.setMinimumDismissTimeInterval(1.5)
}


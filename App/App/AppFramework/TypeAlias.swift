//
//  TypeAlias.swift
//  App
//
//  Created by LXF on 2018/7/16.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation
import FastComponent

// MARK: -
// MARK: - 使用的统一在这里
typealias Loger = Facade.Loger

// MARK: -
// MARK: - 框架内统一到这里
extension Facade{
    typealias Loger = XXLoger
    
}

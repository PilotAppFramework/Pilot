//
//  XXBaseTableViewCellIdProvideProtocol.swift
//  APP
//
//  Created by LXF on 2018/1/18.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import Foundation


/// cell id 提供者
public protocol XXCellIdProvideProtocol {
    func cellId(_ indexPath:IndexPath)->String
}

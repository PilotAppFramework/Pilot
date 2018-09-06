//
//  MagicLoger.swift
//  App
//
//  Created by LXF on 2018/7/23.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation

// MARK: -
// MARK: - 返回 非nil 或者 默认对象
/// 后缀
postfix operator ~~

postfix func ~~(a: String?)              -> String              { return a == nil ? "" : a! }
postfix func ~~(a: Int?)                 -> Int                 { return a == nil ? 0 : a! }
postfix func ~~(a: Int8?)                -> Int8                { return a == nil ? 0 : a!}
postfix func ~~(a: Int16?)               -> Int16               { return a == nil ? 0 : a! }
postfix func ~~(a: Int32?)               -> Int32               { return a == nil ? 0 : a! }
postfix func ~~(a: Int64?)               -> Int64               { return a == nil ? 0 : a! }
postfix func ~~(a: UInt?)                -> UInt                { return a == nil ? 0 : a! }
postfix func ~~(a: Double?)              -> Double              { return a == nil ? 0 : a! }
postfix func ~~(a: Float?)               -> Float               { return a == nil ? 0 : a! }
postfix func ~~(a: [AnyObject]?)         -> [AnyObject]         { return a == nil ? [] : a! }
postfix func ~~(a: [String]?)            -> [String]            { return a == nil ? [] : a! }
postfix func ~~(a: [Int]?)               -> [Int]               { return a == nil ? [] : a! }
postfix func ~~(a: [String: AnyObject]?) -> [String: AnyObject] { return a == nil ? [:] : a! }
postfix func ~~(a: [String: String]?)    -> [String: String]    { return a == nil ? [:] : a! }


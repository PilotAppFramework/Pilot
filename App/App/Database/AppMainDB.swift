//
//  AppDatabase.swift
//  GRDBDemo
//
//  Created by Rdxer on 2017/12/23.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import GRDB
import FastComponent

/// var db = Facade.shared.singleton(type: AppMainDB.Self)
public class AppMainDB: SingletonProtocol  {
    
    func willDeinit(facade: Facade) {
        
    }
    
    var maps: String?
    
    required public init() {
        
    }
    
    ///
    func didInit(facade: Facade) {
        setupMainDatabase(facade.application)
    }
    
    public var queue: DatabaseQueue!
    public var dbFileName: String = "maim.db"
    
    ///init
    func setupMainDatabase(_ application: UIApplication){
        do {
            let databaseURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(dbFileName)
            print("[DBPath] >> " + databaseURL.path)
            queue = try GRDBEx.openDatabase(atPath: databaseURL.path, migrator: databaseMigratorConfig())
            queue.setupMemoryManagement(in: application)
        } catch  {
            assert(false, "初始化数据库失败\(error.localizedDescription)")
        }
    }

    ///  数据库迁移  
    func databaseMigratorConfig()-> DatabaseMigrator {
        
        var migrator = DatabaseMigrator()
        
        /// 新建附件表
        migrator.registerMigration("v1_created_Attachment") { db in
            try db.create(table: "Attachment") { t in
                
                t.column("fileCode", Database.ColumnType.text).primaryKey()
                t.column("orgCode", Database.ColumnType.text)
                t.column("createdByName", Database.ColumnType.text)
                t.column("fileName", Database.ColumnType.text)
                t.column("createdDate", Database.ColumnType.text)
                t.column("approveCode", Database.ColumnType.text)
                t.column("createdBy", Database.ColumnType.text)
                
                t.column("downloadAt", Database.ColumnType.text)
                t.column("fileSize", Database.ColumnType.double)
                t.column("localFileName", Database.ColumnType.text)
            }
        }
        
        return migrator
    }
}


//        /// 创建`通讯录`数据表
//        /// 2017/12/26
//        migrator.registerMigration("v2_created_Address_2017_12_26") { db in
//            try db.create(table: "Address") { t in
//
//                /// 主键
//                t.column("STAFF_CODE", Database.ColumnType.text).primaryKey()
//
//                t.column("RANK_NAME", Database.ColumnType.text)
//                t.column("STAFF_NUMBER", Database.ColumnType.text)
//                t.column("STAFF_NAME", Database.ColumnType.text)
//                t.column("DEPARTMENTNAME", Database.ColumnType.text)
//                t.column("ROWNO", Database.ColumnType.integer)
//                t.column("POSITION_NAME", Database.ColumnType.text)
//                t.column("STAFF_GENDER", Database.ColumnType.text)
//                t.column("SEGMENT_VALUE_DESC", Database.ColumnType.text)
//                t.column("PHONE", Database.ColumnType.text)
//                t.column("EMAIL", Database.ColumnType.text)
//                t.column("SH_PICTURE", Database.ColumnType.text)
//            }
//        }
//
//        /// 创建`短信验证已完毕 记录`数据表  SMSVerificationEnded
//        /// 2018_01_11
//        migrator
//            .registerMigration("v2_created_SMSVerificationEnded_2018_01_11") { db in
//                try db.create(table: "SMSVerificationEnded") { t in
//                    /// 主键
//                    t.column("USERNAME", Database.ColumnType.text).primaryKey()
//                }
//        }


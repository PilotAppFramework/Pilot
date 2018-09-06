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
public class AppUserDB: SingletonProtocol  {
    
    required public init() {
        
    }
    
    var maps: String?
    ///
    func didInit(facade: Facade) {
        setupMainDatabase(facade.application)
    }
    
    func willDeinit(facade: Facade) {
        log.d(""+maps!)
    }
    
    public var queue: DatabaseQueue!
    public var uid: String = ""
    public var dbFileName: String = "user.db"
    
    ///init
    func setupMainDatabase(_ application: UIApplication){
        do {
            let databaseURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(uid+dbFileName)
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

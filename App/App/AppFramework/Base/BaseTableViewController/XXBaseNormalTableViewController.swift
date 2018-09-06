//
//  BaseNormalViewController.swift
//  APP
//
//  Created by LXF on 2018/1/10.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit

class XXBaseNormalTableViewController<ModelClass,CellClass:XXBaseTableViewCell<ModelClass>>: XXBaseTableViewController {
    
    var dataList:[ModelClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    open func prepareTableView(){
        self.automaticallyAdjustsScrollViewInsets = false
     
        tableView.tableFooterView = UIView.init()
        tableView.backgroundColor = AC.backgroundColor
        tableView.estimatedRowHeight = 100
        
        registerCell()
    }
    
    open func registerCell(){
        tableView.register(CellClass.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Table view data source
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellClass
        
        let model = dataList[indexPath.row]
        cell.model = model
        
        prepareCell(cell: cell, model: model, tableView: tableView, indexPath: indexPath)
        
        return cell
    }
    
    /// 如果重写了 tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    /// 则此方法不会自动调用
    open func prepareCell(cell:CellClass,model:ModelClass,tableView: UITableView,indexPath: IndexPath){
        
    }
    
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// 点击动画实现
        tableView.deselectRow(at: indexPath, animated: true)
        let model = dataList[indexPath.row]
        self.tableView(tableView, didSelectRowAt: indexPath, model: model)
    }
    
   
    /// 点击事件
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath,model:ModelClass) {
        
    }
    
}

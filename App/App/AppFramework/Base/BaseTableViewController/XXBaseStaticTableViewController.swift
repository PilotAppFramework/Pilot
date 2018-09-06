//
//  BaseStaticTableViewController.swift
//  APP
//
//  Created by LXF on 2018/1/5.
//  Copyright © 2018年 Rdxer. All rights reserved.
//


import UIKit
import FastComponent
import Moya

/// 纯代码静态 cell 父类
class XXBaseStaticTableViewController: XXBaseTableViewController {
    
    open var cellList:[UITableViewCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        cellList = prepareCellList()
    }
    /// 需要调用 父类  初始化 tableView  也可以全部都自己初始化
    open func prepareTableView(){
        tableView.backgroundColor = AC.backgroundColor
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView.init()
        tableView.estimatedRowHeight = 70
    }
}

extension XXBaseStaticTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellList[indexPath.row]
    }
}

extension XXBaseStaticTableViewController{
    /// 初始化 cell
    @objc
    open func prepareCellList()->[UITableViewCell]{return []}
    /// 重新加载 静态 cell & tableView.reloadData()
    open func reloadCell_reloadData(){
        cellList = prepareCellList()
        tableView.reloadData()
    }
}


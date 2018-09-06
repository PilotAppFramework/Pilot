//
//  XXBaseTableViewController.swift
//  APP
//
//  Created by Rdxer on 2017/12/6.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

class XXBaseTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44
    }
    
    open var style: UITableViewStyle?
    
}

//
//  THHomeImageControol.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/6/29.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHomeImageControol: THHomeBassTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(THHomeImageCell.self, forCellReuseIdentifier: "THHomeImageCell")
    }
}
extension  THHomeImageControol {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadeArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "THHomeImageCell", for: indexPath)as!THHomeImageCell
        
        let model=dadeArr[indexPath.row]
        cell.homeImage=model
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  
        return dadeArr[indexPath.row].imageCellHeight
    }
    
    
    
}

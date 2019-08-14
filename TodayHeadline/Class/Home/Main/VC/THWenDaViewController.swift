//
//  THWenDaViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/14.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THWenDaViewController: UIViewController {
    /// 问答数据
    var wenda = THWendaAnswer()
    var answers = [WendaAnswer]()
    var qid = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    lazy var tableView = { () -> UITableView in
        let table=UITableView()
        table.delegate=self
        table.dataSource=self
        table.register(THWenDaTableViewCell.self, forCellReuseIdentifier: "THWenDaTableViewCell")
        return table
    }
    lazy var bottom :UIButton = {
        let button=UIButton.init()
        return button
    }()
   
}

extension THWenDaViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let   cell = tableView.dequeueReusableCell(withIdentifier: "THWenDaTableViewCell", for: indexPath) as! THWenDaTableViewCell
        return cell
    }
    
    
}

//
//  THPopTableView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/22.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

protocol THPopTableViewDelegate: NSObject {
    /// 详情控制器将要消失
    func PopTableViewDidSelectClick(indexPath:IndexPath)
}

class THPopTableView: UIView {
    
    var delegate = THPopTableViewDelegate.self
    var titles=[String]()
    var imagesName=[String]()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
   func initWithTitles(titles:[String],images:[String]) -> THPopTableView {
    let  frame = CGRect.init(x: 0, y: 0, width: 150, height: 44*titles.count)
    
       self.titles=titles
       self.imagesName=images
      let TableView=THPopTableView.init(frame: frame)
       self.addSubview(TableView)
    
      return TableView
    }
    
    
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
    
    
    
    //MARK:懒加载
    lazy var tableView: UITableView = {
        let table=UITableView.init(frame: self.bounds, style: UITableView.Style.plain)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.isScrollEnabled = false
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        return table
    }()

}
extension THPopTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let THPopTableViewIdentifier="THPopTableView"
        var cell=tableView.dequeueReusableCell(withIdentifier: THPopTableViewIdentifier)
        if cell==nil {
            cell=UITableViewCell.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: THPopTableViewIdentifier)
            cell!.backgroundColor = UIColor.clear
            cell!.textLabel?.textColor=UIColor.white
            let lineView=UIView.init(frame: CGRect.init(x: 0, y: 47.5, width: 150, height: 0.5))
            lineView.backgroundColor=UIColor.lightGray
            cell?.contentView.addSubview(lineView)
        }
        cell?.textLabel?.text=self.titles[indexPath.row]
        if self.imagesName.count>indexPath.row {
            cell?.imageView?.image=UIImage.init(named: self.imagesName[indexPath.row])
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       // delegate.PopTableViewDidSelectClick(indexPath)
    }
    
    
    
}

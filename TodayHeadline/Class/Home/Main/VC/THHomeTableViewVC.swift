//
//  THHomeTableViewVC.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/6/30.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHomeTableViewVC: THHomeBassTableViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
       tableView.register(THHomeCell.self, forCellReuseIdentifier: "THHomeCell")
       tableView.register(THTheyAlsoUseCell.self, forCellReuseIdentifier: "THTheyAlsoUseCell")
       tableView.register(THHomeUserCell.self, forCellReuseIdentifier: "THHomeUserCell")
    }
    
    
}

extension THHomeTableViewVC{
    
  override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadeArr.count
    }
    override  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = dadeArr[indexPath.row]
        print(model.cell_type)
        switch model.cell_type {
        case .none:
            return model.cellHeight 
            
        case .relatedConcern:
            return 290.0
        case .user:
            return model.UserCellH ?? 200
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model=dadeArr[indexPath.row]
        switch model.cell_type {
        case .none:
            let cell=tableView.dequeueReusableCell(withIdentifier:"THHomeCell", for:indexPath) as! THHomeCell
            cell.textmodel=model
            return cell
            
       
        case .user:
              let cell=tableView.dequeueReusableCell(withIdentifier:"THHomeUserCell", for:indexPath) as! THHomeUserCell
             cell.textModel=model
             return cell
        case .relatedConcern:
              let cell=tableView.dequeueReusableCell(withIdentifier:"THTheyAlsoUseCell", for:indexPath) as! THTheyAlsoUseCell
              cell.smallVieo=model.raw_data
             return cell
        }
        
        
      
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model=dadeArr[indexPath.row]
       
        if newsTitle.categoryType == .questionAndAnswer{
            //跳转问答
            let  defailVC=THWenDaViewController()
               defailVC.qid=model.item_id
               defailVC.enterForm = .clickHeadline
            navigationController?.pushViewController(defailVC, animated: true)
        }else{
            //还得添加视频
            switch model.cell_type {
            case .none:
                let  defailVC=THDefailWebViewController()
               navigationController?.pushViewController(defailVC, animated: true)
              //用户
            case .user:
                let  defailVC=THUserVC()
                navigationController?.pushViewController(defailVC, animated: true)
        //用户详情
            case .relatedConcern:

                let  defailVC=THUserMesseageViewController()
                navigationController?.pushViewController(defailVC, animated: true)
            }
        }
    }
    
    
    
}


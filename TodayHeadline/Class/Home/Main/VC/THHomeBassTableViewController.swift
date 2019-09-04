//
//  THHomeBassTableViewController.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/6/29.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

import MJRefresh

class THHomeBassTableViewController: UITableViewController {
/**把所有子类的共同体抽取出来 比如下拉刷新 数据源数组 都有播放器**/
    //数据源
    var dadeArr = [THTexstsModel]()
    //刷新界面模型
    var newsTitle=THNewsTitleModel()
    //播放器
    lazy var thPlayer:BMPlayer=THPlayerManager.sharedManager
    //刷新时间
    var maxBehotTime:TimeInterval=0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRefresh(categry: self.newsTitle.categoryType)
    }
    /**设置透视图**/
    func setupRefresh(categry:NewsTitleCategory)  {
    //透视图刷新
       let heard  = MJRefreshGifHeader.init(refreshingBlock: {
        THHomeVM.loadNewsFeeds(category: categry, ttFrome: .pull, completionHander: {[weak self] (BehotTime, texts) in
            self?.maxBehotTime=BehotTime
            self?.tableView.mj_header.endRefreshing()
            
            self?.dadeArr=texts
            self?.tableView.reloadData()
        })
    })
        heard?.lastUpdatedTimeLabel.isHidden = true
        //切换透明度
        heard?.isAutomaticallyChangeAlpha=true
        heard?.stateLabel.isHidden=true
        var images = [UIImage]()
        // 遍历
        for index in 0..<14 {
            let image = UIImage(named: "dragdown_loading_0\(index)")
            images.append(image!)
        }
       heard?.setImages(images, for: MJRefreshState.idle)
        heard?.setImages(images, for: MJRefreshState.refreshing)
//        heard?.setImages(<#T##images: [Any]!##[Any]!#>, for: MJRefreshState.)
        tableView.mj_header=heard
        tableView.mj_header.beginRefreshing()
        let custemWeb=THWebView.shareManager(frame: CGRect.zero)
        
        //底视图加载
        tableView.mj_footer=MJRefreshAutoFooter(refreshingBlock: {
            
            THHomeVM.loadMoreNewsFeed(categray: categry, ttfrom: .pull, maxReshTime: self.maxBehotTime, fromCount: self.dadeArr.count, completionHander: {[weak self] (texts) in
                self?.tableView.mj_footer.endRefreshing()
                
                if texts.count==0{
                    print("没有耕读数据了")
                }
                self?.dadeArr+=texts
                self?.tableView.reloadData()
                
            })
        })
        tableView.mj_footer.isAutomaticallyChangeAlpha = true
        
        
    }
    
   

}
extension THHomeBassTableViewController:JXSegmentedListContainerViewListDelegate{
    func listView() -> UIView {
        return self.view
    }
    
    
    
    
}

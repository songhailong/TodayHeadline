//
//  THRecommendedView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/16.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import RxSwift
class THRecommendedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableview)
        addSubview(headerView)
        addSubview(footView)
        headerView.flodButton.addTarget(self, action: #selector(flodButtonAction), for: UIControl.Event.touchUpInside)
        footView.moreButton.addTarget(self, action: #selector(moreButtonAction), for: UIControl.Event.touchUpInside)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// 点击了查看更多
    var didSelectCheckMoreButton: (()->())?
    /// 点击了 cell
    var didSelectCell:((_ video:THTexstsModel)->())?
    
    /// 是否展开
    var isUnflod = false
    
    var headerView = RelatedVideoHeaderView()
    var footView=RelatedVideoFooterView()
    
    var videodetail = VideoDetail(){
        didSet{
            footView.adModel=self.videodetail.ad
            tableview.height = CGFloat(self.videodetail.related_video_section) * 80.0
            footView.y = tableview.frame.maxY
            height = footView.frame.maxY
            // 如果之前有数据，这里需要 reload 一下
            tableview.reloadData()
        }
    }
    
    var video = THTexstsModel(){
        didSet{
            headerView.video=self.video
            tableview.x=0
            tableview.width=screenWidth
            tableview.y=headerView.frame.maxY
        }
    }
    
    
    ///展开
    ///
    /// - Parameter sender: <#sender description#>
    @objc func flodButtonAction(sender:UIButton)  {
        
    }
    
  /// 查看更多
  ///
  /// - Parameter sendr: <#sendr description#>
  @objc  func moreButtonAction(sendr:UIButton) {
        self.isUnflod=true
    UIView.animate(withDuration: 0.25) {
        self.tableview.height=CGFloat(self.videodetail.related_video_toutiao.count)*80
    }
    
       self.tableview.reloadData()
      self.footView.y=self.tableview.frame.maxY
    
    }
    
    lazy var tableview: UITableView = {
        let tableview=UITableView.init(frame: self.bounds, style:.plain)
        tableview.delegate=self
        tableview.dataSource=self
        tableview.separatorStyle = .none
        //设置不滚动
        tableview.showsVerticalScrollIndicator=false
        tableview.isScrollEnabled = false
        tableview.register(THRecommentCell.self, forCellReuseIdentifier: "THRecommentCell")
        return tableview
    }()
    
    
    
    
    

}
extension THRecommendedView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videodetail.related_video_toutiao.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "THRecommentCell", for: indexPath)
      return cell
    }
    
    
}

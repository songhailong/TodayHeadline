//
//  THVideoDetailViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/10.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import RxSwift
import MJRefresh
protocol VideoDetailViewControllerDelegate: class {
    /// 详情控制器将要消失
    func VideoDetailViewControllerViewWillDisappear(_ realVideo: RealVideo, _ currentTime: TimeInterval, _ currentIndexPath: IndexPath)
}
class THVideoDetailViewController: UIViewController {
     weak var delegate: VideoDetailViewControllerDelegate?
    
    //播放器
    lazy var player:BMPlayer=THPlayerManager.sharedManager
    /// 当前视频数据
    var video = THTexstsModel()
    /// 评论数据
    private var comments = [DongtaiComment]()
    /// 真实视频地址
    var realVideo = RealVideo()
    /// 当前播放的时间
    var currentTime: TimeInterval = 0
    /// 当前点击的索引
    var currentIndexPath = IndexPath(item: 0, section: 0)
    
    var isPlayer=true
    private let disposeBag = DisposeBag()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor=UIColor.white
         navigationController?.setNavigationBarHidden(true, animated: animated)
         self.tabBarController?.tabBar.isHidden=true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        //loadData(with: video)
        //addAction()
        
        if isPlayer{
            
        }else{
            self.player.setVideo(resource: BMPlayerResource.init(url: URL(string:realVideo.video_list.video_1.mainURL)!))
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden=false
        
        delegate?.VideoDetailViewControllerViewWillDisappear(realVideo, currentTime, currentIndexPath)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    
    
    func configUI()  {
        player.delegate=self
        view.addSubview(player)
        //view.addSubview(backButton)
        view.addSubview(tableView)
        view.addSubview(userView)
        view.addSubview(bottom)
      
        player.snp.makeConstraints { (mask) in
            mask.top.equalToSuperview().offset(isIphoneX ? 40 : 0)
            mask.left.right.equalToSuperview().offset(0)
            mask.height.equalTo(screenWidth*9/16)
        }
//        backButton.snp.makeConstraints { (mask) in
//            mask.leading.equalTo(view).offset(10)
//            mask.size.equalTo(CGSize(width: 35, height: 35))
//            mask.top.equalTo(player.snp.top).offset(10)
//        }
        userView.snp.makeConstraints { (mask) in
            mask.top.equalTo(player.snp.bottom)
            mask.left.right.equalTo(view)
            mask.height.equalTo(45)
        }
        bottom.snp.makeConstraints { (mask) in
            mask.bottom.equalToSuperview().offset(0)
            mask.left.right.equalTo(view)
            mask.height.equalTo(50)
        }
        tableView.snp.makeConstraints { (mask) in
            mask.top.equalTo(userView.snp.bottom)
            mask.bottom.equalTo(bottom.snp.top).offset(0)
            mask.left.right.equalTo(view)
        }
       
        player.backBlock = {[weak self] sender in
            self?.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    
    
    /// 获取数据
    ///
    /// - Parameter video: <#video description#>
    func loadData(with video: THTexstsModel)  {
        
        MBProgressHUD.show("正在加载")
        
        THVideoDefailVM.parseVideoRealURL(video_id: video.video_detail_info.video_id) { (realVideo) in
             self.realVideo = realVideo
        }
        
        
        //获取视频详情
        THVideoDefailVM.loadArticleInformation(from: "click_video", itemId: video.item_id, groupId:video.group_id) { (resspond:VideoDetail) in
            self.userView.userInfo=resspond.user_info
            
            self.recommendedView.video = self.video
            self.recommendedView.videodetail = resspond
            self.tableView.tableHeaderView = self.recommendedView
            MBProgressHUD.hide()
        }
        
        tableView.mj_footer = MJRefreshAutoGifFooter.init(refreshingBlock: {
            [weak self] in
            THVideoDefailVM.loadUserDetailNormalDongtaiComents(groupId: self!.video.group_id, offset: self!.comments.count, count: 20, completionHandler: { (dataArr) in
                self?.tableView.mj_footer.endRefreshing()
                self?.tableView.mj_footer.pullingPercent=0.0
                if dataArr.count == 0 {
                    MBProgressHUD.showInfo("没有数据")
                    return
                }
                 MBProgressHUD.hide()
                self?.comments += dataArr
                self?.tableView.reloadData()
                
            })
        })
        tableView.mj_footer.beginRefreshing()
    }
    
    
  /// 返回监听事件
//  @objc  func backClick()  {
//        print("视频返回")
//        self.navigationController?.popViewController(animated: true)
//    }
    
    
    
   //评论列表
    lazy var tableView: UITableView = {
        let tableview=UITableView()
        tableview.register(THDongtaiCommentCell.self, forCellReuseIdentifier: "THDongtaiCommentCell")
        tableview.separatorStyle = .none
        tableview.tableFooterView=UIView()
        tableview.delegate=self
        tableview.dataSource=self
        return tableview
    }()
    
    /// 返回按钮
    private lazy var backButton: UIButton = {
        let backButton = UIButton()
//        backButton.addTarget(self, action: #selector(backClick), for: UIControl.Event.touchUpInside)
        backButton.setImage(UIImage(named: "personal_home_back_white_24x24_"), for: .normal)
        return backButton
    }()
    lazy var loveButton:UIButton = {
        let  loveButton=UIButton()
    
        return loveButton
    }()
    lazy var userView: VideoDetailUserView = {
        let userView=VideoDetailUserView()
        return userView
    }()
    lazy var recommendedView: THRecommendedView = {
        let  recommendedView=THRecommendedView()
        return recommendedView
    }()
    lazy var bottom: THVideoDefailBottomView = {
        let bottom=THVideoDefailBottomView()
        return bottom
    }()
    
   
    deinit {
        
        self.player.pause()
        //self.player=nil
        //tableView=nil
    }
    
}

extension THVideoDetailViewController{
    private func addAction() {
        userView.coverButton.addTarget(self, action: #selector(coverButtonClick), for: UIControl.Event.touchUpInside)
        
        
        recommendedView.didSelectCheckMoreButton =  { [weak self] in
            self!.tableView.tableHeaderView = self!.recommendedView
        }
        
        recommendedView.didSelectCell = {[weak self] (model) in
            switch model.card_type {
            case .video, .adVideo:  // 视频、广告视频
                // 获取数据
                self!.loadData(with:model)
            case .adTextlink:       // 广告链接
                if self!.player.isPlaying { self!.player.pause() }
                //let textLinkVC = TextLinkViewController()
                //textLinkVC.url = $0.web_url
               // self!.navigationController?.pushViewController(textLinkVC, animated: true)
            }
          
            
        }
        
        
    }
    
    @objc func coverButtonClick(sender:UIButton)  {
        
    }
    
    
    
    
    
}




extension THVideoDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell   = tableView.dequeueReusableCell(withIdentifier: "THDongtaiCommentCell", for: indexPath) as!THDongtaiCommentCell
        cell.comment=comments[indexPath.row]
        return cell
    }
    
    
}
extension THVideoDetailViewController:BMPlayerDelegate{
    func bmPlayer(player: BMPlayer, playerStateDidChange state: BMPlayerState) {
        
    }
    
    func bmPlayer(player: BMPlayer, loadedTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playTimeDidChange currentTime: TimeInterval, totalTime: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerIsPlaying playing: Bool) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerOrientChanged isFullscreen: Bool) {
        
    }
    
    
}

//
//  THVideoDetailViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/10.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
protocol VideoDetailViewControllerDelegate: class {
    /// 详情控制器将要消失
    func VideoDetailViewControllerViewWillDisappear(_ realVideo: RealVideo, _ currentTime: TimeInterval, _ currentIndexPath: IndexPath)
}
class THVideoDetailViewController: UIViewController {
     weak var delegate: VideoDetailViewControllerDelegate?
    /// 当前视频数据
    var video = THTexstsModel()
    /// 评论数据
   // private var comments = [DongtaiComment]()
    /// 真实视频地址
    var realVideo = RealVideo()
    /// 当前播放的时间
    var currentTime: TimeInterval = 0
    /// 当前点击的索引
    var currentIndexPath = IndexPath(item: 0, section: 0)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "navigation_background"), for: UIBarMetrics.compact)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}

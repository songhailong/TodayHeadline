//
//  THHomeVideoTableViewController.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/6/29.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import RxSwift

class THHomeVideoTableViewController: THHomeBassTableViewController {
    /// 播放器
    lazy var player: BMPlayer = BMPlayer(customControlView: SmallVideoPlayerCustomView())
    
    //private lazy var disposeBag = DisposeBag()
    /// 上一次播放的 cell
    private var priorCell: THVideoViewCell?
    /// 视频真实地址
    private var realVideo = RealVideo()
    /// 当前播放的时间
    private var currentTime: TimeInterval = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(THVideoViewCell.self, forCellReuseIdentifier: "THVideoViewCell")
        tableView.rowHeight = screenWidth * 0.67
    }
    /// 移除播放器
    private func removePlayer() {
        player.pause()
        player.removeFromSuperview()
        priorCell = nil
    }
    /**把当前播放器放在最后一行****/
   private func addPlayer(cell:THVideoViewCell)  {
        cell.hideSubviews()
    THHomeVM.parseVideoRealURL(video_id: cell.textModel.video_detail_info.video_id, completionHandler:{ [weak self] (readVideo) in
        self?.realVideo = readVideo
        cell.bgImageButton.addSubview(self!.player )
       
        self!.player.snp.makeConstraints({ (mask) in
            mask.edges.equalTo(cell.bgImageButton)
        })
        
        print("nhoihio\(readVideo.video_list.video_1.main_url)")
        
        self!.player.setVideo(resource: BMPlayerResource.init(url: URL(string:readVideo.video_list.video_1.mainURL)!))
      self?.priorCell=cell
        
    })
    
    
    }
    
    
}
extension THHomeVideoTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadeArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "THVideoViewCell", for: indexPath) as! THVideoViewCell
        
        let model=dadeArr[indexPath.row]
        cell.textModel=model
        cell.bgImageButton.tag=indexPath.row
        cell.bgImageButton.addTarget(self, action: #selector(videopale), for: UIControl.Event.touchUpInside)
       // cell.bgImageButton.rx.ta
        
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curruentCell = tableView.cellForRow(at: indexPath)as! THVideoViewCell
        if player.isPlaying {
            removePlayer()
        }
        let videoDetailVC = THVideoDetailViewController()
        videoDetailVC.video = curruentCell.textModel
        videoDetailVC.delegate = self
        videoDetailVC.currentTime = currentTime
        videoDetailVC.currentIndexPath = indexPath
       
    navigationController?.pushViewController(videoDetailVC, animated: true)
    }
    
    @objc func videopale(btn:UIButton){
        let cell=self.tableView.cellForRow(at: NSIndexPath.init(row: btn.tag, section: 0) as IndexPath)
        if self.priorCell != cell {
            self.priorCell?.showSubviews()
            //=是否正在播放  如果播放就暂停和删除
            if self.player.isPlaying{
                self.player.pause()
                self.player.removeFromSuperview()
            }
             self.addPlayer(cell: cell as! THVideoViewCell)
        }else{
            //点击了当前cell
            // 说明是第一次点击 cell，直接添加播放器
            // 把播放器添加到 cell 上
            self.addPlayer(cell: cell as! THVideoViewCell)
        }
        
        
    }
    
}

// MARK: - VideoDetailViewControllerDelegate
extension THHomeVideoTableViewController: VideoDetailViewControllerDelegate {
    /// 详情控制器将要消失
    func VideoDetailViewControllerViewWillDisappear(_ realVideo: RealVideo, _ currentTime: TimeInterval, _ currentIndexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: currentIndexPath) as! THVideoViewCell
        currentCell.bgImageButton.addSubview(player)
        player.snp.makeConstraints({ $0.edges.equalTo(currentCell.bgImageButton) })
        // 设置视频播放地址
        player.setVideo(resource: BMPlayerResource(url: URL(string: realVideo.video_list.video_1.mainURL)!))
        // 设置当前播放时间
        player.seek(currentTime)
        // 视频播放时隐藏 cell 的部分子视图
       // currentCell.hideSubviews()
        self.priorCell = currentCell
    }
}



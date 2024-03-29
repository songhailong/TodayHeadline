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
   // lazy var player: BMPlayer = BMPlayer(customControlView: BMPlayerControlView())
    
    //private lazy var disposeBag = DisposeBag()
    /// 上一次播放的 cell
    private var priorCell: THVideoViewCell?
    /// 视频真实地址
    private var realVideo = RealVideo()
    
    private var palyerCurrunt=0
    /// 当前播放的时间
    private var currentTime: TimeInterval = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(THVideoViewCell.self, forCellReuseIdentifier: "THVideoViewCell")
        tableView.rowHeight = screenWidth * 0.67
    }
    /// 移除播放器
    private func removePlayer() {
        thPlayer.pasuPlayingfromCellSuperview()
        //thPlayer.prepareToDealloc()
        priorCell = nil
        self.palyerCurrunt=0
    }
    /**把当前播放器放在最后一行****/
    private func addPlayer(cell:THVideoViewCell,indexPath:NSIndexPath)  {
        cell.hideSubviews()
    THHomeVM.parseVideoRealURL(video_id: cell.textModel.video_detail_info.video_id, completionHandler:{ [weak self] (readVideo) in
        self?.realVideo = readVideo
        self?.palyerCurrunt=indexPath.row
        cell.bgImageButton.addSubview(self!.thPlayer )
       
        self!.thPlayer.snp.makeConstraints({ (mask) in
            mask.edges.equalTo(cell.bgImageButton)
        })
        
        print("nhoihio只是播放\(indexPath.row)")
        
        self!.thPlayer.setVideo(resource: BMPlayerResource.init(url: URL(string:readVideo.video_list.video_1.mainURL)!))
      self?.priorCell=cell
        
    })
    
    
    }
    
    
    
    func loadparseVideoUrl(textModel:THTexstsModel,control:THVideoDetailViewController)  {
        THHomeVM.parseVideoRealURL(video_id: textModel.video_detail_info.video_id) {[weak self] (readVideoR)  in
            self?.realVideo = readVideoR
            self?.removePlayer()
            self!.thPlayer.setVideo(resource: BMPlayerResource.init(url: URL(string:readVideoR.video_list.video_1.mainURL)!))
            //self?.thPlayer.playerLayer?.placeholderView.kf.setImage(with:URL.init(string: textModel.video_detail_info.detail_video_large_image.urlString))
            self?.thPlayer.playerLayer?.placeholderView.sd_setImage(with: URL.init(string: textModel.video_detail_info.detail_video_large_image.urlString), completed: nil)
            control.player=self!.thPlayer
            
            self?.navigationController?.pushViewController(control, animated: true)
        }
    }
    
    
    
    
    deinit {
        
        self.thPlayer.pause()
        tableView=nil
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
        
        let videoDetailVC = THVideoDetailViewController()
        videoDetailVC.video = curruentCell.textModel
        videoDetailVC.delegate = self
        videoDetailVC.currentTime = currentTime
        videoDetailVC.currentIndexPath = indexPath
       if thPlayer.isPlaying {
        if curruentCell==self.priorCell{
             videoDetailVC.currentTime = currentTime
            videoDetailVC.player=thPlayer
            navigationController?.pushViewController(videoDetailVC, animated: true)
        }else{
            
           loadparseVideoUrl(textModel:curruentCell.textModel, control: videoDetailVC)
        }
        
        
       }else{
          loadparseVideoUrl(textModel:curruentCell.textModel, control: videoDetailVC)
        
        }
        
        
        
        
        
    }
    
    
  /// cell cell出现在界面
  ///
  /// - Parameters:
  ///   - tableView: <#tableView description#>
  ///   - cell: <#cell description#>
  ///   - indexPath: <#indexPath description#>
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
    if self.palyerCurrunt>indexPath.row+3||self.palyerCurrunt<indexPath.row-3{
        self.removePlayer()
    }
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
    /// 滑动的时候
    ///
    /// - Parameter scrollView: <#scrollView description#>
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
      print("当前选择cell\(palyerCurrunt)")
        if palyerCurrunt != 0{
            //计算cell在tableview 中的坐标值
//            let recttableview=self.tableView.rectForRow(at: NSIndexPath.init(row: palyerCurrunt, section: 0) as IndexPath)
//            //计算在父视图的坐标/当前cell在屏幕中的坐标值
//            let rectSuperView=self.tableView.convert(recttableview, to: tableView.superview)
//
//            print("现在的坐标\(rectSuperView)大小包括基本健康不积跬步")
//
//            if recttableview.origin.y>self.view.frame.height{
//                 print("从下方发出下下\(palyerCurrunt)")
//                //cell从下方划出
//                self.removePlayer()
//            }else if rectSuperView.origin.y+self.view.frame.height<0{
//                //从上方划出
//                 print("从上方发出上上\(palyerCurrunt)")
//                self.removePlayer()
//            }
            
        }
    }
    
    
    @objc func videopale(btn:UIButton){
        let cell=self.tableView.cellForRow(at: NSIndexPath.init(row: btn.tag, section: 0) as IndexPath)as! THVideoViewCell
        
       
        if self.priorCell != cell {
            self.priorCell?.showSubviews()
            //=是否正在播放  如果播放就暂停和删除
            if self.thPlayer.isPlaying{
                self.thPlayer.pause()
                self.thPlayer.removeFromSuperview()
            }
            self.addPlayer(cell: cell, indexPath: NSIndexPath.init(row: btn.tag, section: 0))
        }else{
            //点击了当前cell
            // 说明是第一次点击 cell，直接添加播放器
            // 把播放器添加到 cell 上
             //self.thPlayer.playerLayer?.placeholderView.kf.setImage(with: URL.init(string: cell.textModel.video_detail_info.detail_video_large_image.urlString ))
            
            self.thPlayer.playerLayer?.placeholderView.sd_setImage(with: URL.init(string: cell.textModel.video_detail_info.detail_video_large_image.urlString ), completed: nil)
            
            self.addPlayer(cell: cell, indexPath: NSIndexPath.init(row: btn.tag, section: 0))
        }
        
        
    }
    
}

// MARK: - VideoDetailViewControllerDelegate
extension THHomeVideoTableViewController: VideoDetailViewControllerDelegate {
    /// 详情控制器将要消失
    func VideoDetailViewControllerViewWillDisappear(_ realVideo: RealVideo, _ currentTime: TimeInterval, _ currentIndexPath: IndexPath) {
//        let currentCell = tableView.cellForRow(at: currentIndexPath) as! THVideoViewCell
//        currentCell.bgImageButton.addSubview(player)
//        player.snp.makeConstraints({ $0.edges.equalTo(currentCell.bgImageButton) })
//        // 设置视频播放地址
//        player.setVideo(resource: BMPlayerResource(url: URL(string: realVideo.video_list.video_1.mainURL)!))
//        // 设置当前播放时间
//        player.seek(currentTime)
//        // 视频播放时隐藏 cell 的部分子视图
//       // currentCell.hideSubviews()
//        self.priorCell = currentCell
    }
}



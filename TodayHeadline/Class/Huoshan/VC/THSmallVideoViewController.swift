//
//  THSmallVideoViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/9.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import NVActivityIndicatorView
class THSmallVideoViewController: THBassViewController {
    /// 播放器
    private lazy var player = THPlayerManager.sharedManager
    
    /// 小视频数组
    var smallVideos = [THTexstsModel]()
    /// 原始 索引
    var originalIndex = 0
    /// 当前索引
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.addSubview(collectionView)
        collectionView.scrollToItem(at: NSIndexPath.init(row: originalIndex, section: 0) as IndexPath, at: .centeredVertically, animated: false)
       setupPlayer(currentIndex: originalIndex)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.player.pasuPlayingfromCellSuperview()
    }
    
    
    lazy var titleButton: UIButton = {
        let titleBtn=UIButton()
        return titleBtn
    }()
    lazy var commentButton: UIButton = {
        let commentButton=UIButton()
        return commentButton
    }()
    lazy var diggButton: UIButton = {
        let diggButton=UIButton()
        return diggButton
    }()
    
    lazy var shareButton: UIButton = {
        let shareButton=UIButton()
        return shareButton
    }()
    
    lazy var collectionView: UICollectionView = {
        let smallVideoLayout=UICollectionViewFlowLayout()
        smallVideoLayout.itemSize = CGSize(width: screenWidth, height: screenHeight)
        smallVideoLayout.minimumLineSpacing = 0
        smallVideoLayout.minimumInteritemSpacing = 0
        smallVideoLayout.scrollDirection = .vertical
         let collectionView=UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight), collectionViewLayout: smallVideoLayout)
       
         collectionView.isPagingEnabled=true
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.register(THSmallVideoCellCell.self, forCellWithReuseIdentifier: "THSmallVideoCellCell")
        return collectionView
        
    }()
    
    func setupPlayer(currentIndex: Int)  {
        let smallVideo = smallVideos[currentIndex]
        if  let videoURLString = smallVideo.raw_data.video.play_addr.url_list.first{
            //self.player.backgroundColor=UIColor.green
            //代理没有执行完成
//            let cell = self.collectionView.cellForItem(at: IndexPath(item: currentIndex, section: 0)) as! THSmallVideoCellCell
//            if self.player.isPlaying { self.player.pause() }
//            //                    // 先把 bgImageView 的子视图移除，再添加
//            for subview in cell.bgImageView.subviews { subview.removeFromSuperview() }
//            cell.bgImageView.addSubview(self.player)
//            self.player.snp.makeConstraints({ $0.edges.equalTo(cell.bgImageView) })
//
//            if let firstImage = smallVideo.raw_data.first_frame_image_list.first {
//                self.player.playerLayer?.placeholderView.kf.setImage(with: URL(string: firstImage.urlString)!)
//                print(firstImage.urlString)
//            }else if let largeImage = smallVideo.raw_data.large_image_list.first{
//
//                self.player.playerLayer?.placeholderView.kf.setImage(with: URL(string: largeImage.url as String)!)
//            }
//
            
            
            
            
            
            let dataTask = URLSession.shared.dataTask(with: URL(string: videoURLString)!, completionHandler: { (data, response, error) in
                // 货到主线程添加播放器
                DispatchQueue.main.async {
                    // 获取当前的 cell
                    let cell = self.collectionView.cellForItem(at: IndexPath(item: currentIndex, section: 0)) as! THSmallVideoCellCell
                    if self.player.isPlaying { self.player.pause() }
//                    // 先把 bgImageView 的子视图移除，再添加
                   for subview in cell.bgImageView.subviews { subview.removeFromSuperview() }
                    cell.bgImageView.addSubview(self.player)
                   self.player.snp.makeConstraints({ $0.edges.equalTo(cell.bgImageView) })

                    if let firstImage = smallVideo.raw_data.first_frame_image_list.first {
                        self.player.playerLayer?.placeholderView.kf.setImage(with: URL(string: firstImage.urlString)!)
                        print(firstImage.urlString)
                    }else if let largeImage = smallVideo.raw_data.large_image_list.first{

                        self.player.playerLayer?.placeholderView.kf.setImage(with: URL(string: largeImage.url as String)!)
                    }
                    
                    
                    
                    let asset = BMPlayerResource(url: URL(string: response!.url!.absoluteString)!)
                    self.player.setVideo(resource: asset)
                }
            })
            dataTask.resume()
            
        }
    }

    

}

extension THSmallVideoViewController:UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return smallVideos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          setupPlayer(currentIndex: indexPath.row)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "THSmallVideoCellCell", for: indexPath) as! THSmallVideoCellCell
        //print("显示的cell索引\(indexPath.row)")
        cell.textModel=smallVideos[indexPath.row]
        return cell
    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let currentIndex = Int(scrollView.contentOffset.y / scrollView.width + 0.5)
//        // 根据当前索引设置播放器
//        setupPlayer(currentIndex: currentIndex)
//    }
    @objc func closeAction() {
        self.player.prepareToDealloc()
        self.player.playerLayer?.playerItem?.cancelPendingSeeks()
        self.player.playerLayer?.playerItem?.asset.cancelLoading()
       dismiss(animated: false, completion: nil)
    }
    
}

extension THSmallVideoCellCell{
   @objc func closeAction() {
    
        THSmallVideoViewController().dismiss(animated: false, completion: nil)
    }
    @objc func topShareBtnAction(){
    
    }
    @objc func searchBtnAction() {
    
    }
}

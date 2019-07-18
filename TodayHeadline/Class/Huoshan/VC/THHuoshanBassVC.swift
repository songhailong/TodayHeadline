//
//  THHuoshanBassVC.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/8.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHuoshanBassVC: THBassViewController {
  
    lazy var collectionView: UICollectionView = {
        let colectionlayout=UICollectionViewFlowLayout.init()
        let itemWidth = (screenWidth - 2) * 0.5
        colectionlayout.itemSize=CGSize.init(width: itemWidth, height: itemWidth*1.5)
        colectionlayout.scrollDirection = .vertical
       // colectionlayout.sectionInset=UIEdgeInsets.init(top: 0, left: 0, bottom: -2, right: 0)
        colectionlayout.minimumLineSpacing=1.0
        colectionlayout.minimumInteritemSpacing=1.0
        
        
        
      let collectionView=UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight-tabBarHeight-stausHeight-40.0), collectionViewLayout: colectionlayout)
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.register(THHotCell.self, forCellWithReuseIdentifier: "THHotCell")
        collectionView.backgroundColor=UIColor.white
        return collectionView
    }()
    
    
    //刷新时间
    var maxBehotTime:TimeInterval=0.0
    var dataArr = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionView)
        setupRefresh()
        
    }
    
    func setupRefresh()  {
        let heard  = MJRefreshGifHeader.init(refreshingBlock: {
            THHomeVM.loadNewsFeeds(category: .hotsoonVideo, ttFrome: .enterAuto, completionHander: { [weak self] (BehotTime, texts) in
                self?.maxBehotTime=BehotTime
                self?.dataArr=texts
                self!.collectionView.reloadData()
                self?.collectionView.mj_header.endRefreshing()
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
        collectionView.mj_header=heard
        collectionView.mj_header.beginRefreshing()
        
        
        
    collectionView.mj_footer=MJRefreshAutoGifFooter.init(refreshingBlock: {
         [weak self] in
        
        
        })
        collectionView.mj_footer.isAutomaticallyChangeAlpha=true
        
    }
    
    
    
    
}
extension THHuoshanBassVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,JXSegmentedListContainerViewListDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:THHotCell = collectionView .dequeueReusableCell(withReuseIdentifier: "THHotCell", for: indexPath) as! THHotCell
        
       let model=self.dataArr [indexPath.row]
        //cell.backgroundColor=UIColor.red
        cell.smallVideo=model as! THTexstsModel
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let smallVideoVC = THSmallVideoViewController()
        smallVideoVC.originalIndex = indexPath.row
        smallVideoVC.smallVideos = dataArr as! [THTexstsModel]
        present(smallVideoVC, animated: false, completion: nil)
    }
    
    
    func listView() -> UIView {
        return self.view
    }
    
    
}

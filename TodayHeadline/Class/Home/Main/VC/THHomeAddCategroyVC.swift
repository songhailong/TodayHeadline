//
//  THHomeAddCategroyVC.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/18.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHomeAddCategroyVC: THBassViewController {
    
    var isEdit=false{
        didSet{
            collectionView.reloadData()
        }
    }
    
    
    
    
    
    // 上部 我的频道
    private var homeTitles = [THTexstsModel]()
    // 下部 频道推荐数据
    private var categories = [THTexstsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   @objc func longPressTarget(pross:UILongPressGestureRecognizer)  {
        //先获取 选中的点位置
      let selectPonit=pross.location(in: collectionView)
    
    if let selectIndexPath = collectionView.indexPathForItem(at: selectPonit){
        
    }
    
    
    
    }
    
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor=UIColor.white
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView=UICollectionView.init(frame: CGRect.init(x: 0, y: 30, width: screenWidth, height: screenHeight-stausHeight-30), collectionViewLayout: AddCategoryFlowLayout())
        collectionView.delegate=self
        collectionView.dataSource=self
       collectionView.register(THHomeAddCategryCell.self, forCellWithReuseIdentifier: "THHomeAddCategryCell")
    collectionView.register(THHomeChannelCell.self, forCellWithReuseIdentifier: "THHomeChannelCell")
        collectionView.register(THHomeAddHeadViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "THHomeAddHeadViewCell")
        return collectionView
    }()
    
    lazy var longPressRecognizer: UILongPressGestureRecognizer = {
   let  longPress=UILongPressGestureRecognizer(target: self, action: #selector(longPressTarget))
        return longPress
    }()
    
    
}

extension THHomeAddCategroyVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,AddCategoryCellDelagate{
    func deleteCategoryButtonClicked(of cell: THHomeAddCategryCell) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headCell=collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "THHomeAddHeadViewCell", for: indexPath) as! THHomeAddHeadViewCell
        headCell.isEdit = isEdit
        
       
        
        return headCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? homeTitles.count : categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row==0{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "THHomeAddCategryCell", for: indexPath) as! THHomeAddCategryCell
            cell.delegate=self
            return cell
        }else{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "THHomeChannelCell", for: indexPath)
            return cell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    /// headerView 的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screenWidth, height: 50)
    }
    
    
    /// 每个 cell 之间的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    //是否可以移动
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    //移动cell
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    
    
    
}


/// 布局
class AddCategoryFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        // 每个 cell 的大小
        itemSize = CGSize(width: (screenWidth - 50) * 0.25, height: 44)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
    }
}

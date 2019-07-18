//
//  THHomeAddCategroyVC.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/18.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHomeAddCategroyVC: THBassViewController {
    
    // 上部 我的频道
    private var homeTitles = [THTexstsModel]()
    // 下部 频道推荐数据
    private var categories = [THTexstsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    
    
}

extension THHomeAddCategroyVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? homeTitles.count : categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row==0{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "THHomeAddCategryCell", for: indexPath)
            return cell
        }else{
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "THHomeChannelCell", for: indexPath)
            return cell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
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

//
//  HomeImageCollectionView.swift
//  News
//
//  Created by 杨蒙 on 2018/2/6.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit

class HomeImageCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, NibLoadable {
    
    var images = [ImageList]() {
        didSet {
            reloadData()
        }
    }
    
    var didSelect: ((_ selectedIndex: Int)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //collectionViewLayout = DongtaiCollectionViewFlowLayout()
        setCollectionViewLayout(DongtaiCollectionViewFlowLayout(), animated: true)
        ym_registerCell(cell: HomeImageCell.self)
        delegate = self
        dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(images.count)
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ym_dequeueReusableCell(indexPath: indexPath) as HomeImageCell
        cell.image = images[indexPath.item]
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: image3Width, height: image3Width)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect?(indexPath.item)
    }
}
class DongtaiCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        minimumLineSpacing = 5
        minimumInteritemSpacing = 5
        sectionInset=UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 5)
        scrollDirection = .horizontal
        itemSize=CGSize.init(width: image3Width, height: image3Width*0.7)
    }
}

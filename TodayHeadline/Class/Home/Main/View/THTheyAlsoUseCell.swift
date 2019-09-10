//
//  THTheyAlsoUseCell.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/7/3.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THTheyAlsoUseCell: UITableViewCell {
    var smallVieo=THSmallVideo(){
        didSet{
            leftLable.text = self.smallVieo.title
            rightButton.setTitle(self.smallVieo.show_more, for: .normal)
            userCards = self.smallVieo.user_cards
            collectinView.reloadData()
        }
    }
    /***作者数组***/
    var userCards = [UserCard]()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI()  {
        self.contentView.addSubview(self.leftLable)
        self.contentView.addSubview(self.rightButton)
        self.contentView.addSubview(self.bottomView)
        self.contentView.addSubview(self.collectinView)
        self.leftLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.top.equalToSuperview().offset(5)
            mask.height.equalTo(50)
            mask.right.equalTo(self.rightButton.snp.left).offset(-10)
            
        }
        self.rightButton.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-15)
            mask.height.equalTo(50)
            mask.top.equalToSuperview().offset(5)
            mask.width.equalTo(62)
        }
        self.bottomView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.top.equalToSuperview().offset(5)
            mask.height.equalTo(10)
            mask.bottom.equalToSuperview().offset(0)
            
        }
        self.collectinView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.top.equalTo(self.leftLable.snp_bottom).offset(0)
            mask.bottom.equalTo(self.bottomView.snp_top).offset(0)
            mask.right.equalToSuperview().offset(15)
            
            
        }
        
        
        
    }
  
    
    lazy var collectinView: UICollectionView = {
        let collectinView=UICollectionView.init()
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 15, bottom: 10, right: 10)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 215)
        collectinView.collectionViewLayout=layout
        collectinView.delegate=self
        collectinView.dataSource=self
        collectinView.ym_registerCell(cell: TheyUseCollectionCell.self)
        return collectinView
    }()
    lazy var bottomView: UIView = {
        let bottomView=UIView()
        bottomView.isOpaque=true
        return bottomView
    }()
    
    
    lazy var rightButton: UIButton = {
        let rightBtn=UIButton()
        rightBtn.setTitle("查看更多", for: .normal)
        rightBtn.titleLabel?.font=UIFont.systemFont(ofSize: 15)
        rightBtn.titleLabel?.textColor=UIColor.black
        rightBtn.isOpaque=true
        return rightBtn
    }()
    
    

    lazy var leftLable: UILabel = {
        let leftLable=UILabel()
        leftLable.text="他们也在用头条"
        leftLable.font=UIFont.systemFont(ofSize: 15)
        leftLable.textColor=UIColor.black
        return leftLable
    }()
    
}
extension THTheyAlsoUseCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ym_dequeueReusableCell(indexPath: indexPath) as TheyUseCollectionCell
        cell.userCard = userCards[indexPath.item]
        return cell
    }
    
    
}


//
//  THHomeAddCategryCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/18.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
protocol AddCategoryCellDelagate: class {
    func deleteCategoryButtonClicked(of cell: THHomeAddCategryCell)
}

class THHomeAddCategryCell: UICollectionViewCell {
    weak var delegate: AddCategoryCellDelagate?
    
    var isEdit=false{
        didSet{
            delegateBtn.isHidden = !isEdit
            
            if backButton.titleLabel?.text=="推荐"||backButton.titleLabel?.text=="热点"{
                delegateBtn.isHidden=true
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(backButton)
        backButton.addSubview(delegateBtn)
        backButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(0)
            mask.top.equalToSuperview().offset(0)
            mask.bottom.equalToSuperview().offset(0)
        }
        delegateBtn.snp.makeConstraints { (mask) in
          
            mask.right.equalToSuperview().offset(0)
            mask.top.equalToSuperview().offset(0)
           mask.width.equalTo(20)
            mask.height.equalTo(20)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  @objc  func delegateClick()  {
        delegate?.deleteCategoryButtonClicked(of: self)
    }
    
    lazy var backButton: UIButton = {
        let backBtn=UIButton()
        backBtn.titleLabel?.textColor=UIColor.black
        return backBtn
    }()
    lazy var delegateBtn: UIButton = {
        let  delegateBtn = UIButton()
        delegateBtn.addTarget(self, action: #selector(delegateClick), for: UIControl.Event.touchUpInside)
        delegateBtn.setImage(UIImage.init(named: "closeicon_repost_18x18_"), for: .normal)
        return delegateBtn
    }()
    
}

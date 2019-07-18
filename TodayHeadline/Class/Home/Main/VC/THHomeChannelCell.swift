//
//  THHomeChannelCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/18.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHomeChannelCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius=3
        self.contentView.addSubview(titleButton)
        titleButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
             mask.right.equalToSuperview().offset(0)
             mask.top.equalToSuperview().offset(0)
             mask.bottom.equalToSuperview().offset(0)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleButton: UIButton = {
        let titleButton=UIButton()
        titleButton.layer.shadowColor = UIColor(r: 240, g: 240, b: 240).cgColor
        titleButton.layer.shadowOffset = CGSize(width: 0, height: 0)        //shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        titleButton.layer.shadowOpacity = 1                                 //阴影透明度，默认0
        titleButton.layer.shadowRadius = 1                                  //阴影半径，默认3
        titleButton.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        return titleButton
    }()
}

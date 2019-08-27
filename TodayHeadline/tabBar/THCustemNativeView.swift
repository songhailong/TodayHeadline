//
//  THCustemNativeView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/26.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THCustemNativeView: UIView {
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isUserInteractionEnabled=true
        self.addSubview(titleLable)
        self.addSubview(leftButton)
        self.addSubview(leftBtn1)
        self.addSubview(rightButton)
        self.addSubview(rightBtn2)
        leftButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.top.equalToSuperview().offset(stausHeight)
           mask.width.height.equalTo(44)
        }
        rightButton.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-10)
            mask.top.equalToSuperview().offset(stausHeight)
            mask.width.height.equalTo(44)
        }
        
        rightBtn2.snp.makeConstraints { (mask) in
            mask.right.equalTo(rightButton.snp.left).offset(-10)
            mask.top.equalToSuperview().offset(stausHeight)
            mask.width.height.equalTo(44)
        }
        leftBtn1.snp.makeConstraints { (mask) in
            mask.left.equalTo(leftButton.snp_right).offset(10)
            mask.top.equalToSuperview().offset(stausHeight)
            mask.width.height.equalTo(44)
        }
        titleLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(leftBtn1.snp_right).offset(0)
            mask.top.equalToSuperview().offset(stausHeight)
            mask.bottom.equalToSuperview().offset(0)
            mask.right.equalTo(rightBtn2.snp_left).offset(0)
        }
    }
    
    
    lazy var leftBtn1: UIButton = {
        let leftBtn1=UIButton()
        return leftBtn1
    }()
    
    lazy var titleLable: UILabel = {
        let titleLable=UILabel()
        titleLable.backgroundColor=UIColor.red
        titleLable.textColor=UIColor.black
        titleLable.textAlignment=NSTextAlignment.center
        titleLable.text="今日头条"
        return titleLable
    }()

    lazy var leftButton: UIButton = {
        let leftButton=UIButton()
        leftButton.setImage(UIImage.init(named: "lefterbackicon_titlebar_24x24_"), for: .normal)
        return leftButton
    }()
    lazy var rightButton: UIButton = {
        let  rightButton=UIButton()
        rightButton.setImage(UIImage.init(named: "morebutton_dynamic_night_14x8_"), for: .normal)
        return rightButton
    }()
    lazy var rightBtn2: UIButton = {
        let  rightBtn2=UIButton()
        rightBtn2.setImage(UIImage.init(named: "search_small_16x16_"), for: .normal)
        return rightBtn2
    }()
    

}

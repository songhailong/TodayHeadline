//
//  THCustemNativeView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/26.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THCustemNativeView: UIView {
 @objc   func leftaction()  {
        
    }
    
   @objc func rightAction()  {
        print("youmian")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
         self.isUserInteractionEnabled=true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       // self.isUserInteractionEnabled=true
        
        //self.backgroundColor=UIColor.red
        self.addSubview(titleLable)
        self.addSubview(leftButton1)
        self.addSubview(leftBtn1)
        self.addSubview(rightButton)
        self.addSubview(rightBtn2)
        leftButton1.snp.makeConstraints { (mask) in
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
            mask.left.equalTo(leftButton1.snp_right).offset(10)
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
        leftBtn1.backgroundColor=UIColor.red
        return leftBtn1
    }()
    
    lazy var titleLable: UILabel = {
        let titleLable=UILabel()
        titleLable.backgroundColor=UIColor.green
        titleLable.textColor=UIColor.black
        titleLable.textAlignment=NSTextAlignment.center
        titleLable.text="今日头条"
        return titleLable
    }()

    lazy var leftButton1: AnimatableButton = {
        let leftButton1=AnimatableButton()
        leftButton1.setImage(UIImage.init(named: "lefterbackicon_titlebar_24x24_"), for: .normal)
        leftButton1.backgroundColor=UIColor.red
        leftButton1.addTarget(self, action: #selector(leftaction), for: UIControl.Event.touchUpInside)
        return leftButton1
    }()
    lazy var rightButton: UIButton = {
        let  rightButton=UIButton()
        rightButton.setImage(UIImage.init(named: "morebutton_dynamic_night_14x8_"), for: .normal)
        rightButton.addTarget(self, action: #selector(rightAction), for: UIControl.Event.touchUpInside)
        return rightButton
    }()
    lazy var rightBtn2: UIButton = {
        let  rightBtn2=UIButton()
        rightBtn2.setImage(UIImage.init(named: "search_small_16x16_"), for: .normal)
        return rightBtn2
    }()
    

}

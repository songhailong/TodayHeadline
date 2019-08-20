//
//  THVideoDefailBottomView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/16.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THVideoDefailBottomView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(commentVidew)
        self.addSubview(expressionBtn)
        self.addSubview(writcomment)
        self.addSubview(cornernBtn)
        commentVidew.addSubview(shareButton)
        commentVidew.addSubview(collection)
        commentVidew.addSubview(commentsLable)
        let height=self.frame.size.height
        shareButton.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-10)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.height.equalTo(height-10)
        }
        collection.snp.makeConstraints { (mask) in
            mask.right.equalTo(shareButton.snp_left).offset(-10)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.height.equalTo(height-10)
        }
        commentsLable.snp.makeConstraints { (mask) in
            mask.right.equalTo(collection.snp_left).offset(-10)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.height.equalTo(height-10)
        }
        
        commentVidew.snp.makeConstraints { (mask) in
            mask.right.equalTo(commentsLable.snp_left).offset(-10)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.equalTo(height-10)
            mask.left.equalToSuperview().offset(10)
        }
//        expressionBtn.snp.makeConstraints { (mask) in
//            mask.right.equalTo(commentsLable.snp_left).offset(-10)
//            mask.bottom.equalToSuperview().offset(-5)
//            mask.height.equalTo(height-10)
//            mask.left.equalToSuperview().offset(10)
//        }
        writcomment.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(0)
            mask.bottom.equalToSuperview().offset(0)
            mask.height.equalTo(height-10)
            mask.left.equalToSuperview().offset(0)
        }
        writcomment.layer.cornerRadius=(height-10)/2
//        cornernBtn.snp.makeConstraints { (mask) in
//            mask.right.equalTo(commentsLable.snp_left).offset(-10)
//            mask.bottom.equalToSuperview().offset(-5)
//            mask.height.equalTo(height-10)
//            mask.left.equalToSuperview().offset(10)
//        }
        
        
    }
    
    lazy var commentVidew: AnimatableView = {
        let  commentVidew=AnimatableView()
        return commentVidew
    }()
    
 //表情按钮
    lazy var expressionBtn: UIButton = {
        let expressionBtn = UIButton()
        return expressionBtn
    }()
    lazy var writcomment: UIButton = {
        let writcomment = UIButton()
        writcomment.setImage(UIImage.init(named: "write_new_24x24_"), for: .normal)
        return writcomment
    }()
    
    lazy var cornernBtn: UIButton = {
        let cornernBtn = UIButton()
        return cornernBtn
    }()
    
    
    
    //分享按钮
    lazy var shareButton: UIButton = {
        let shareBtn = UIButton()
        return shareBtn
    }()
    lazy var collection: UIButton = {
        let collection = UIButton()
        return collection
    }()
    
    lazy var commentsLable: UIButton = {
        let commentsLable = UIButton()
        return commentsLable
    }()
    
    
}

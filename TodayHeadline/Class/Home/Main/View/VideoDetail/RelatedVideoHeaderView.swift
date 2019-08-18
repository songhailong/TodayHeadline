//
//  RelatedVideoHeaderView.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/8/17.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class RelatedVideoHeaderView: UIView {
    
    var video = THTexstsModel() {
        didSet {
            titleLable.titleLabel?.text = video.title
            playCountLable.text = video.video_detail_info.videoWatchCount + "次播放"
            diggButton.setTitle(video.diggCount, for: .normal)
            descriptionLable.text = video.description
           // publishTimeLabel.text = video.publishTime + "发布"
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(titleLable)
        addSubview(playCountLable)
        addSubview(paqButton)
        addSubview(diggButton)
        addSubview(flodButton)
        addSubview(wechatButton)
        addSubview(descriptionLable)
        titleLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.top.equalToSuperview().offset(0)
            mask.right.equalTo(flodButton.snp_left).offset(0)
            mask.height.equalTo(20)
        }
        playCountLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.top.equalTo(titleLable.snp_bottom).offset(0)
            mask.right.equalTo(flodButton.snp_left).offset(0)
            mask.height.equalTo(20)
        }
        flodButton.snp.makeConstraints { (mask) in
             mask.top.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(-15)
            mask.height.width.equalTo(20)
        }
        descriptionLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.top.equalTo(playCountLable.snp_bottom).offset(0)
            mask.right.equalToSuperview().offset(-10)
            mask.height.equalTo(0)
        }
        
        wechatButton.snp.makeConstraints { (mask) in
            mask.left.equalTo(paqButton.snp_right).offset(10)
            mask.top.equalTo(descriptionLable.snp_bottom).offset(0)
            mask.width.equalTo(flodButton.snp_left).offset(image3Width)
            mask.height.equalTo(30)
        }
        diggButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.top.equalTo(descriptionLable.snp_bottom).offset(0)
            mask.width.equalTo(flodButton.snp_left).offset(image3Width)
            mask.height.equalTo(30)
        }
        paqButton.snp.makeConstraints { (mask) in
            mask.left.equalTo(diggButton.snp_right).offset(10)
            mask.top.equalTo(titleLable.snp_bottom).offset(0)
            mask.right.equalTo(flodButton.snp_left).offset(0)
            mask.height.equalTo(20)
        }
       
        
        
    }

    lazy var titleLable: UIButton = {
        let  titleLable=UIButton()
        titleLable.titleLabel?.textColor=UIColor.black
        titleLable.titleLabel?.font=UIFont.systemFont(ofSize: 16)
        return titleLable
    }()
    
    lazy var flodButton: UIButton = {
        let  flodButton=UIButton()
        flodButton.setImage(UIImage.init(named: "video_detail_arrow_down_night_12x5_"), for: .normal)
        return flodButton
    }()
    lazy var playCountLable: UILabel = {
        let  playCountLable=UILabel()
        playCountLable.textColor=UIColor.gray
        playCountLable.font=UIFont.systemFont(ofSize: 13)
        return playCountLable
    }()
    
    lazy var descriptionLable: UILabel = {
        let  descriptionLable=UILabel()
        descriptionLable.textColor=UIColor.gray
        descriptionLable.font=UIFont.systemFont(ofSize: 13)
        return descriptionLable
    }()
    
    
    lazy var diggButton: UIButton = {
        let diggButton=UIButton()
        diggButton.layer.cornerRadius=15
        diggButton.setImage(UIImage.init(named: "details_like_icon_20x20_"), for: .normal)
        diggButton.setTitle("赞", for: .normal)
        return diggButton
    }()
    
    lazy var wechatButton: UIButton = {
        let wechatButton=UIButton()
        wechatButton.layer.cornerRadius=15
        wechatButton.setImage(UIImage.init(named: "video_center_share_weChat_28x28_"), for: .normal)
        wechatButton.setTitle("微信", for: .normal)
        return wechatButton
    }()
    lazy var paqButton: UIButton = {
        let paqButton=UIButton()
        paqButton.layer.cornerRadius=15
      paqButton.setImage(UIImage.init(named: "video_center_share_pyq_28x28_"), for: .normal)
        paqButton.setTitle("分享朋友圈", for: .normal)
        return paqButton
    }()
    

}

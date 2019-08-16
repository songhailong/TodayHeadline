//
//  THDongtaiCommentCell.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/8/15.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THDongtaiCommentCell: UITableViewCell {

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(avatarButton)
         contentView.addSubview(nameLable)
         contentView.addSubview(authInfoLabel)
         contentView.addSubview(diggBtn)
         contentView.addSubview(contentLabel)
         contentView.addSubview(replayButton)
         contentView.addSubview(timeLabel)
        avatarButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.top.equalToSuperview().offset(10)
            mask.width.height.equalTo(40)
        }
        nameLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(avatarButton.snp_right).offset(10)
            mask.right.equalTo(diggBtn.snp_left).offset(-5)
            mask.top.equalToSuperview().offset(10)
            mask.height.equalTo(20)
        }
        diggBtn.snp.makeConstraints { (mask) in
            mask.top.equalToSuperview().offset(10)
            mask.width.equalTo(60)
            mask.height.equalTo(20)
            mask.right.equalToSuperview().offset(-10)
        }
        contentLabel.snp.makeConstraints { (mask) in
            mask.left.equalTo(avatarButton).offset(15)
            mask.top.equalTo(nameLable.snp_bottom).offset(10)
            mask.height.equalTo(20)
            mask.right.equalToSuperview().offset(-15)
        }
        timeLabel.snp.makeConstraints { (mask) in
            mask.left.equalTo(avatarButton).offset(15)
            mask.top.equalTo(contentLabel.snp_bottom).offset(10)
            mask.height.equalTo(20)
            mask.width.equalTo(60)
        }
        replayButton.snp.makeConstraints { (mask) in
            mask.left.equalTo(timeLabel.snp_right).offset(15)
            mask.top.equalTo(contentLabel.snp_bottom).offset(10)
            mask.height.equalTo(20)
            mask.width.equalTo(40)
        }
    }
    
    
    //头像
    lazy var avatarButton:AnimatableButton = {
        let avatarButton=AnimatableButton()
        return avatarButton
    }()
    
    /// 用户名字
    lazy var nameLable: UILabel = {
        let namealable=UILabel()
        return namealable
    }()
    //认证内容
    lazy var authInfoLabel: UILabel = {
        let authInfoLabel=UILabel()
        return authInfoLabel
    }()
    //点赞按钮
    lazy var diggBtn: UIButton = {
        let diggBtn=UIButton()
        return diggBtn
    }()
    //内容
    lazy var contentLabel: UILabel = {
        let contentLabel=UILabel()
        return contentLabel
    }()
    //时间
    lazy var timeLabel: UILabel = {
        let timeLabel=UILabel()
        return timeLabel
    }()
    //回复
    lazy var replayButton: AnimatableButton = {
        let replayButton=AnimatableButton ()
        return replayButton
    }()

}

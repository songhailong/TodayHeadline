//
//  THRecommendedView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/16.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THRecommendedView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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

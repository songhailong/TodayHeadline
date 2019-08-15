//
//  THWenDaTableViewCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/14.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THWenDaTableViewCell: UITableViewCell {
    
    var answer=WendaAnswer(){
        didSet{
            
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configUI()  {
        self.contentView.addSubview(topView)
        self.topView.addSubview(concernButton)
        topView.addSubview(avatarImageView)
        avatarImageView.addSubview(vImageView)
        topView.addSubview(nameLable)
        topView.addSubview(userIntroLabel)
        self.contentView.addSubview(separatorView)
        self.contentView.addSubview(diggLable)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(readCountLabel)
        self.contentView.addSubview(humbImageView)
        self.contentView.addSubview(forwarding)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(topView)
        self.topView.addSubview(concernButton)
        topView.addSubview(avatarImageView)
        avatarImageView.addSubview(vImageView)
        topView.addSubview(nameLable)
        topView.addSubview(userIntroLabel)
        self.contentView.addSubview(separatorView)
        self.contentView.addSubview(diggLable)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(readCountLabel)
        self.contentView.addSubview(humbImageView)
        self.contentView.addSubview(forwarding)
        
        topView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.right.equalToSuperview().offset(-10)
            mask.top.equalToSuperview().offset(0)
            mask.height.equalTo(55)
        }
        avatarImageView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.width.equalToSuperview().offset(40)
            mask.top.equalToSuperview().offset(10)
          mask.height.equalTo(40)
        }
        concernButton.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(0)
            mask.width.equalToSuperview().offset(60)
            mask.top.equalToSuperview().offset(10)
           mask.height.equalTo(20)
        }
        
        nameLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(avatarImageView.snp_right).offset(5)
            mask.right.equalTo(concernButton.snp_left).offset(-5)
            mask.top.equalToSuperview().offset(10)
           mask.height.equalTo(20)
        }
        userIntroLabel.snp.makeConstraints { (mask) in
            mask.left.equalTo(avatarImageView.snp_right).offset(5)
            mask.right.equalTo(concernButton.snp_left).offset(-5)
            mask.top.equalTo(nameLable.snp_bottom).offset(5)
            mask.height.equalTo(15)
        }
        contentLabel.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.right.equalToSuperview().offset(-10)
            mask.top.equalTo(nameLable.snp_bottom).offset(5)
             mask.height.equalTo(0)
        }
        humbImageView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.right.equalToSuperview().offset(-10)
            mask.top.equalTo(contentLabel.snp_bottom).offset(5)
            mask.height.equalTo(image3Width)
        }
        diggLable.snp.makeConstraints { (mask) in
            mask.height.equalToSuperview().offset(17)
            mask.right.equalToSuperview().offset(-10)
            mask.bottom.equalToSuperview().offset(0)
            mask.width.equalTo(image3Width)
        }
        readCountLabel.snp.makeConstraints { (mask) in
            mask.height.equalToSuperview().offset(17)
            mask.right.equalTo(diggLable.snp_left).offset(-10)
            mask.bottom.equalToSuperview().offset(0)
            mask.width.equalTo(image3Width)
        }
        forwarding.snp.makeConstraints { (mask) in
            mask.height.equalToSuperview().offset(17)
            mask.right.equalToSuperview().offset(-10)
            mask.bottom.equalToSuperview().offset(0)
            mask.width.equalTo(image3Width)
        }
        
        
    }
    
    
    //头像
    lazy var avatarImageView: UIImageView = {
        let avatarImageView=UIImageView()
        return avatarImageView
    }()
    lazy var vImageView: UIImageView = {
        let vImageView=UIImageView()
        return vImageView
    }()
    
    ///用户认证内容
    lazy var userIntroLabel: UILabel = {
        let userIntroLabel=UILabel()
        return  userIntroLabel
    }()
    /// 关注按钮
    lazy var concernButton: UIButton = {
        let concer=UIButton()
        return concer
    }()
    ///点赞
    lazy var diggLable: UILabel = {
        let diggLable=UILabel()
        return diggLable
    }()
    ///用户名
    lazy var nameLable: UILabel = {
        let nameLable=UILabel()
        return nameLable
    }()
    ///阅读
    lazy var readCountLabel: UILabel = {
        let readCountLabel=UILabel()
        return readCountLabel
    }()
    //转发
    lazy var forwarding: UILabel = {
        let forwarding=UILabel()
        return forwarding
    }()
    //缩略图
    lazy var humbImageView: UIImageView = {
        let humbImageView=UIImageView()
        return humbImageView
    }()
 
    lazy var contentLabel: UILabel = {
        let contentLabel=UILabel()
        return contentLabel
    }()

    lazy var separatorView: UIView = {
        let separatorView=UIView()
        return separatorView
    }()
    lazy var topView: UIView = {
        let topView=UIView()
        return topView
    }()
}

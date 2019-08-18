//
//  THDongtaiCommentCell.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/8/15.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THDongtaiCommentCell: UITableViewCell {
    
    var comment = DongtaiComment(){
        didSet{
            nameLable.text=self.comment.user_name != "" ? self.comment.user_name:""
            if self.comment.user_profile_image_url != ""{
                avatarButton.kf.setImage(with: URL.init(string: self.comment.user_profile_image_url), for: .normal)
            }else if self.comment.avatar_url != ""{
                avatarButton.kf.setImage(with: URL.init(string: self.comment.avatar_url), for: .normal)
            }else if self.comment.user.user_id != 0{
                avatarButton.kf.setImage(with: URL.init(string: self.comment.user.avatar_url), for: .normal)
                nameLable.text=self.comment.user.screen_name
            
            }
            
            
            contentLabel.attributedText=self.comment.attributedContent
            timeLabel.text=self.comment.createTime+"."
            if self.comment.reply_count != 0{
                replayButton.setTitle(comment.reply_count == 0 ? "回复" : "\(comment.reply_count)回复", for: .normal)
               diggBtn.setTitle(comment.digg_count == 0 ? "赞" : comment.diggCount, for: .normal)
                diggBtn.isSelected = comment.user_digg
            }
        }
    }
    

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
        avatarButton.layer.cornerRadius=20
        return avatarButton
    }()
    
    /// 用户名字
    lazy var nameLable: UILabel = {
        let namealable=UILabel()
        namealable.textColor=UIColor.blue
        namealable.font=UIFont.systemFont(ofSize: 16)
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
        diggBtn.setImage(UIImage.init(named: "c_comment_like_icon_18x18_"), for: .normal)
        diggBtn.setTitle("0", for: .normal)
        diggBtn.setTitleColor(THRGBColor(R: 200, G: 200, B: 200), for: .normal)
        return diggBtn
    }()
    //内容
    lazy var contentLabel: UILabel = {
        let contentLabel=UILabel()
        contentLabel.textColor=UIColor.black
        contentLabel.font=UIFont.systemFont(ofSize: 17)
        return contentLabel
    }()
    //时间
    lazy var timeLabel: UILabel = {
        let timeLabel=UILabel()
   timeLabel.textColor=THRGBColor(R: 200, G: 200, B: 200)
        return timeLabel
    }()
    //回复
    lazy var replayButton: AnimatableButton = {
        let replayButton=AnimatableButton ()
        replayButton.layer.cornerRadius=10
        replayButton.backgroundColor=THRGBColor(R: 236, G: 236, B: 236)
        replayButton.titleLabel?.textColor=THRGBColor(R: 60, G: 60, B: 60)
        return replayButton
    }()

}

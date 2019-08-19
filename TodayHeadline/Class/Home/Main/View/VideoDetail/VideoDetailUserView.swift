//
//  VideoDetailUserView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/16.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class VideoDetailUserView: UIView {
    
    /// 用户模型
    var userInfo=NewsUserInfo(){
        didSet{
            avatarImageView.kf.setImage(with: URL.init(string: userInfo.avatar_url))
            nameLable.text=userInfo.name
            followerCountLabel.text = userInfo.fansCount + "粉丝"
            concernButton.isSelected=self.userInfo.follow
            concernButton.borderColor = userInfo.follow ? .grayColor232() : .globalRedColor()
            concernButton.borderWidth = userInfo.follow ? 1 : 0
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 /// 关注点击按钮点击
 ///
 /// - Parameter sender: <#sender description#>
 @objc  func concernButtonClicked(sender:AnimatableButton)  {
    if sender.isSelected{
        //已经关注  取消关注
        THVideoDefailVM.loadRelationUnfollow(userId: userInfo.user_id) { (ConcernUser) in
            sender.isSelected = !sender.isSelected
        }
    }else{
       sender.isSelected = !sender.isSelected
        sender.borderColor = .grayColor232()
        sender.borderWidth = 1
    }
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(coverButton)
        self.addSubview(concernButton)
        coverButton.addSubview(avatarImageView)
        avatarImageView.addSubview(vImageview)
        coverButton.addSubview(nameLable)
        coverButton.addSubview(followerCountLabel)
        coverButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.top.bottom.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(-10)
        }
        concernButton.snp.makeConstraints { (mask) in
            mask.top.equalToSuperview().offset(10)
            mask.right.equalToSuperview().offset(-15)
            mask.width.equalTo(72)
            mask.height.equalTo(28)
        }
        avatarImageView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.top.bottom.equalToSuperview().offset(5)
            mask.width.height.equalTo(30)
        }
        nameLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(avatarImageView.snp_right).offset(5)
            mask.top.equalToSuperview().offset(5)
            mask.height.equalTo(18)
            mask.right.equalToSuperview().offset(0)
        }
        followerCountLabel.snp.makeConstraints { (mask) in
            mask.left.equalTo(avatarImageView.snp_right).offset(5)
            mask.top.equalTo(nameLable.snp_bottom).offset(0)
            mask.height.equalTo(12)
            mask.right.equalToSuperview().offset(0)
        }
    }
    
    
    //覆盖按钮
    lazy var coverButton: UIButton = {
        let coverButton=UIButton()
        return coverButton
    }()
     //头像
    lazy var avatarImageView: UIImageView = {
        let avatarImageView=UIImageView()
        avatarImageView.layer.cornerRadius=15
        return avatarImageView
    }()
    //vip
    lazy var vImageview: UIImageView = {
        let vImageview=UIImageView()
        return vImageview
    }()
    //粉丝数
    lazy var followerCountLabel: UILabel = {
        let connernLable=UILabel()
        connernLable.textColor=UIColor.gray
        connernLable.font=UIFont.systemFont(ofSize: 12)
        return connernLable
    }()
    //关注按钮
    lazy var concernButton: AnimatableButton = {
        let button=AnimatableButton()
        button.addTarget(self, action: #selector(concernButtonClicked), for: UIControl.Event.touchUpInside)
        button.setTitle("关注", for: .normal)
        button.backgroundColor=THRGBColor(R: 228, G: 108, B: 91)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .selected)
        button.setTitle("已关注", for: .selected)
        
        return button
    }()
    ///用户名字
    lazy var nameLable: UILabel = {
        let nameLable=UILabel()
        nameLable.textColor = UIColor.black
        return nameLable
    }()
    
}

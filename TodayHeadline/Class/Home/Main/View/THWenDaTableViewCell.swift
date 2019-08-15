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
          nameLable.text=answer.user.uname
          avatarImageView.kf.setImage(with: URL.init(string: answer.user.avatar_url))
           concernButton.isSelected = answer.user.is_following
             diggLable.text = answer.diggCount
             readCountLabel.text = answer.browCount
            humbImageView.image=nil
            //是否有图片
            if answer.content_abstract.hasImage {
                let thumb = answer.content_abstract.thumb_image_list.first!
                humbImageView.kf.setImage(with: URL(string: thumb.urlString)!)
                humbImageView.snp.updateConstraints { (mask) in
                    mask.width.equalTo(166.0 * thumb.ratio)
                    mask.height.equalTo(166.0)
                }
            }else {
                self.contentLabel.setSeparatedLinesFrom(self.answer.attributedString, hasImage: self.answer.content_abstract.hasImage)
                contentLabel.snp.makeConstraints { (mask) in
                    mask.height.equalTo(answer.content_abstract.textH!)
                }
                
            }
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   //点击回调
    var didSelectCoverButton: (()->())?
    
    
  @objc  func conronAction()  {
        
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
        avatarImageView.image=UIImage.init(named: "")
        return avatarImageView
    }()
    lazy var vImageView: UIImageView = {
        let vImageView=UIImageView()
        return vImageView
    }()
    
    ///用户认证内容
    lazy var userIntroLabel: UILabel = {
        let userIntroLabel=UILabel()
        userIntroLabel.textColor=THRGBColor(R: 188, G: 188, B: 188)
        userIntroLabel.font=UIFont.systemFont(ofSize: 12)
        return  userIntroLabel
    }()
    /// 关注按钮
    lazy var concernButton: UIButton = {
        let concer=UIButton()
        concer.titleLabel?.font=UIFont.systemFont(ofSize: 18)
        concer.titleLabel?.textAlignment=NSTextAlignment.right
        concer.setTitle("关注", for: .normal)
        concer.setTitle("已关注", for: .selected)
        concer.setTitleColor(THRGBColor(R: 219, G: 53, B: 67), for: .normal)
        concer.setTitleColor(THRGBColor(R: 188, G: 188, B: 188), for: .normal)
        concer.addTarget(self, action: #selector(conronAction), for: UIControl.Event.touchUpInside)
        return concer
    }()
    ///点赞
    lazy var diggLable: UILabel = {
        let diggLable=UILabel()
        diggLable.textColor=THRGBColor(R: 128, G: 128, B: 128)
        diggLable.font=UIFont.systemFont(ofSize: 13)
        return diggLable
    }()
    ///用户名
    lazy var nameLable: UILabel = {
        let nameLable=UILabel()
        nameLable.textColor=THRGBColor(R: 188, G: 188, B: 188)
        nameLable.font=UIFont.systemFont(ofSize: 12)
        return nameLable
    }()
    ///阅读
    lazy var readCountLabel: UILabel = {
        let readCountLabel=UILabel()
        readCountLabel.textColor=THRGBColor(R: 128, G: 128, B: 128)
        readCountLabel.font=UIFont.systemFont(ofSize: 13)
        return readCountLabel
    }()
    //转发
    lazy var forwarding: UILabel = {
        let forwarding=UILabel()
        forwarding.textColor=THRGBColor(R: 128, G: 128, B: 128)
        forwarding.font=UIFont.systemFont(ofSize: 13)
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

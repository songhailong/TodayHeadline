//
//  THVideoViewCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/10.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THVideoViewCell: UITableViewCell {
   
    var textModel=THTexstsModel(){
        didSet{
            titleLabel.text = textModel.title
        palyLabel.text=textModel.video_detail_info.videoWatchCount+"次播放"
            //avatarButton.kf.setImage(with: URL(string: textModel.user_info.avatar_url), for: .normal)
            avatarButton.sd_setBackgroundImage(with: URL(string: textModel.user_info.avatar_url), for: .normal, completed: nil)
            
            
             nameLable.text = textModel.user_info.name
            concernButton.isSelected=textModel.user_info.follow
            //bgImageButton.kf.setImage(with: URL(string: textModel.video_detail_info.detail_video_large_image.urlString), for: .normal)
            bgImageButton.sd_setBackgroundImage(with:URL(string: textModel.video_detail_info.detail_video_large_image.urlString) , for: .normal, completed: nil)
            
            timeLableLabel.text=textModel.videoDuration
            commentButton.setTitle(textModel.commentCount, for: .normal)
            //如果是广告隐藏
            concernButton.isHidden = textModel.label_style == .ad
            commentButton.isHidden = textModel.label_style == .ad
            //显示广告
            adButton.isHidden = textModel.label_style != .ad
            adLable.isHidden = textModel.label_style != .ad
            //
            adButton.setTitle((textModel.ad_button.button_text == "" ? "查看详情" : textModel.ad_button.button_text), for: .normal)
            
            if textModel.label_style == .ad {
                //广告 用户名字字段不一样
                nameLable.text = textModel.app_name != "" ? textModel.app_name : textModel.ad_button.app_name
               
            }
            
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func creatUI() {
        
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
    
        self.addSubview(bgImageButton)
        self.addSubview(bottomView)
        
        bgImageButton.snp.makeConstraints { (mask) in
           mask.left.equalToSuperview().offset(0)
           mask.right.equalToSuperview().offset(0)
           mask.top.equalToSuperview().offset(0)
           mask.bottom.equalTo(bottomView.snp_top).offset(0)
        }
        bottomView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(0)
            mask.height.equalTo(40)
            mask.bottom.equalToSuperview().offset(-2)
        }
        
        
        
        
        
        bottomView.addSubview(moreButton)
        bottomView.addSubview(avatarButton)
        bottomView.addSubview(nameLable)
        bottomView.addSubview(descriptionLabel)
        bottomView.addSubview(concernButton)
        bottomView.addSubview(commentButton)
        bottomView.addSubview(adButton)
        bottomView.addSubview(adLable)
        moreButton.snp.makeConstraints { (mask) in

            mask.right.equalToSuperview().offset(-5)
            mask.top.equalToSuperview().offset(5)
            mask.height.equalTo(30)
            mask.width.equalTo(30)
        }
        avatarButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(5)
            mask.top.equalToSuperview().offset(5)
            mask.height.equalTo(30)
            mask.width.equalTo(30)
        }
        nameLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(avatarButton.snp_right).offset(3)
            mask.top.equalToSuperview().offset(10)
            mask.height.equalTo(20)
            mask.width.equalTo(60)
        }
        concernButton.snp.makeConstraints { (mask) in
            mask.left.equalTo(nameLable.snp_right).offset(0)
            mask.top.equalToSuperview().offset(10)
            mask.height.equalTo(20)
             mask.width.equalTo(40)
        }
        commentButton.snp.makeConstraints { (mask) in

            mask.right.equalTo(moreButton.snp_left).offset(-5)
            mask.top.equalToSuperview().offset(5)
            mask.height.equalTo(30)
            mask.width.equalTo(60)
        }
        adButton.snp.makeConstraints { (mask) in
            mask.right.equalTo(moreButton.snp_left).offset(-5)
            mask.centerY.equalTo(bottomView.centerY)
            mask.height.equalTo(30)
            mask.width.equalTo(60)
        }
        adLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(nameLable.snp_right).offset(0)
            mask.top.equalToSuperview().offset(10)
            mask.height.equalTo(20)
            mask.width.equalTo(40)
        }





        bgImageButton.addSubview(PlayImageButton)
        bgImageButton.addSubview(titleLabel)
        bgImageButton.addSubview(palyLabel)
        bgImageButton.addSubview(timeLableLabel)

        PlayImageButton.snp.makeConstraints { (mask) in
            mask.center.equalTo(bgImageButton)
            mask.width.equalTo(44)
            mask.height.equalTo(44)
        }
        titleLabel.snp.makeConstraints { (mask) in
           mask.left.equalToSuperview().offset(10)
           mask.right.equalToSuperview().offset(-10)
           mask.top.equalToSuperview().offset(5)
           mask.height.equalTo(50)
        }
        timeLableLabel.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-5)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.equalTo(50)
            mask.height.equalTo(20)
        }
        palyLabel.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.equalTo(70)
            mask.height.equalTo(20)
        }
        // }
    }
    lazy var bgImageButton: UIButton = {
        let bgImageButton=UIButton()
        bgImageButton.setImage(UIImage.init(named: "titlebar_shadow_20x64_"), for: .normal)
        bgImageButton.clipsToBounds=true
        bgImageButton.contentMode = .scaleAspectFill
        return bgImageButton
    }()
    lazy var PlayImageButton: UIButton = {
        let PlayImageButton=UIButton()
        PlayImageButton.setImage(UIImage.init(named: "video_play_icon_44x44_"), for: .normal)
        return PlayImageButton
    }()
   
    
    lazy var bottomView: UIView = {
        let view=UIView()
        view.backgroundColor=UIColor.white
        return view
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel=UILabel()
        titleLabel.textColor=UIColor.white
        titleLabel.numberOfLines=2
        titleLabel.font=UIFont.systemFont(ofSize: 20)
        return titleLabel
    }()
    
    lazy var palyLabel: UILabel = {
        let titleLabel=UILabel()
        titleLabel.textColor=UIColor.white
        titleLabel.font=UIFont.systemFont(ofSize: 14)
        return titleLabel
    }()
    
    lazy var timeLableLabel: UILabel = {
        let timeLableLabel=UILabel()
        timeLableLabel.font=UIFont.systemFont(ofSize: 13)
        timeLableLabel.textColor=UIColor.white
        timeLableLabel.backgroundColor=UIColor.black
        timeLableLabel.alpha=0.5
        timeLableLabel.layer.cornerRadius=10
        return timeLableLabel
    }()
     /***头像**/
    lazy var avatarButton: UIButton = {
        let avatarButton=UIButton()
        avatarButton.layer.cornerRadius=15
        return avatarButton
    }()
     /***用户名称**/
    lazy var nameLable: UILabel = {
        let nameLable=UILabel()
        nameLable.textColor=UIColor.black
        return nameLable
    }()
     /***详情**/
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel=UILabel()
        return descriptionLabel
    }()
     /***关注**/
    lazy var concernButton: UIButton = {
        let concernButton=UIButton()
        concernButton.titleLabel?.textColor=UIColor.mainBackgroundColor()
        concernButton.setTitle("关注", for: .normal)
        concernButton.setTitle("已关注", for: .selected)
        return concernButton
    }()
     /***评论**/
    lazy var commentButton: UIButton = {
        let commentButton=UIButton()
        commentButton.titleLabel?.textColor=UIColor.black
        commentButton.setImage(UIImage.init(named: "comment_feed_24x24_"), for: .normal)
        return commentButton
    }()
     /***更多**/
    lazy var moreButton: UIButton = {
        let moreButton=UIButton()
        moreButton.setImage(UIImage.init(named: "morebutton_dynamic_night_14x8_"), for: .normal)
        return moreButton
    }()
    /***广告**/
    lazy var  adButton: UIButton = {
        let  adButton=UIButton()
        return adButton
    }()
    /***广告**/
    lazy var  adLable: UILabel = {
        let  lable=UILabel()
        lable.textColor=UIColor.blue
        lable.text="广告"
        lable.font=UIFont.systemFont(ofSize: 12)
        return lable
    }()

}
extension THVideoViewCell{
    /****隐藏cell的部分视图****/
    func hideSubviews()  {
        titleLabel.isHidden=true
        palyLabel.isHidden=true
        timeLableLabel.isHidden=true
        PlayImageButton.isHidden=true
        avatarButton.isHidden=true
        
    }
    
    func showSubviews()  {
        titleLabel.isHidden=false
        palyLabel.isHidden=false
        timeLableLabel.isHidden=false
        avatarButton.isHidden=false
    }
    
    
    
    
}

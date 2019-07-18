//
//  THSmallVideoCellCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/9.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THSmallVideoCellCell: UICollectionViewCell {
    var textModel = THTexstsModel(){
        didSet{
            nameButton.setTitle(textModel.raw_data.user.info.name, for: .normal)
            iconImageView.kf.setImage(with: URL(string: textModel.raw_data.user.info.avatar_url))
            concernButton.isSelected=textModel.raw_data.user.relation.is_following
            //titleLabel.attributedText=textModel.raw_data.at
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor=UIColor.red
        self.addSubview(bgImageView)
        bgImageView.addSubview(iconImageView)
        bgImageView.addSubview(nameButton)
        iconImageView.addSubview(vImageView)
        bgImageView.addSubview(commentButton)
        bgImageView.addSubview(concernButton)
        bgImageView.addSubview(titleLabel)
        bgImageView.addSubview(CombinationVidew)
        bgImageView.addSubview(scrollLabel)
        bgImageView.addSubview(closeBtn)
        bgImageView.addSubview(searchBtn)
        bgImageView.addSubview(topShareBtn)
        bgImageView.snp.makeConstraints { (mask) in
        mask.left.equalToSuperview().offset(0)
        mask.right.equalToSuperview().offset(0)
        mask.bottom.equalToSuperview().offset(0)
        mask.top.equalToSuperview().offset(0)
        
        }
        iconImageView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.bottom.equalTo(commentButton.snp_top).offset(-5)
            mask.width.equalTo(40)
            mask.height.equalTo(40)
            
        }
        nameButton.snp.makeConstraints { (mask) in
            mask.left.equalTo(iconImageView.snp_right).offset(10)
            mask.bottom.equalTo(commentButton.snp_top).offset(-10)
            mask.width.equalTo(90)
            mask.height.equalTo(30)
            
        }
        commentButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.right.equalTo(CombinationVidew.snp_left).offset(-10)
            mask.bottom.equalToSuperview().offset(-stausHeight-10)
            mask.height.equalTo(40)
            
        }
        concernButton.snp.makeConstraints { (mask) in
            mask.left.equalTo(nameButton.snp_right).offset(10)
            mask.bottom.equalTo(commentButton.snp_top).offset(-15)
            mask.width.equalTo(80)
            mask.height.equalTo(30)
            
        }
        CombinationVidew.snp.makeConstraints { (mask) in
           
            mask.right.equalToSuperview().offset(-15)
            mask.bottom.equalToSuperview().offset(-10)
            mask.width.equalTo(40)
            mask.height.equalTo(250)
            
        }
        titleLabel.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.bottom.equalToSuperview().offset(-10)
            mask.width.equalTo(screenWidth-100)
            mask.height.equalTo(0)
        }
        closeBtn.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.top.equalToSuperview().offset(stausHeight)
            mask.width.equalTo(40)
            mask.height.equalTo(40)
        
        }
        
        searchBtn.snp.makeConstraints { (mask) in
            mask.right.equalTo(topShareBtn.snp_left).offset(-15)
            mask.top.equalToSuperview().offset(stausHeight)
            mask.width.equalTo(40)
            mask.height.equalTo(40)
            
        }
        topShareBtn.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-15)
            mask.top.equalToSuperview().offset(stausHeight)
            mask.width.equalTo(40)
            mask.height.equalTo(40)
            
        }
        
    }
    
    
    
    
    //MARK 懒加载
    lazy var iconImageView: UIImageView = {
        let imageview=UIImageView()
        imageview.backgroundColor=UIColor.white
        return imageview
    }()
    /**用户名称按钮***/
    lazy var nameButton: UIButton = {
        let nameButton=UIButton()
        nameButton.titleLabel?.font=UIFont.init(name: "Helvetica-Bold", size: 16)
        
        return nameButton
    }()
    /**ViP头像**/
    lazy var vImageView: UIImageView = {
        let vImageView=UIImageView()
        return vImageView
    }()
    /***关注按钮***/
    lazy var concernButton: UIButton = {
        let concernButton=UIButton()
        concernButton.backgroundColor=UIColor.mainBackgroundColor()
        concernButton.setTitle("关注", for: .normal)
        concernButton.setTitle("已关注", for: .selected)
        concernButton.titleLabel?.textAlignment=NSTextAlignment.center
        return concernButton
    }()
    /**标题***/
    lazy var titleLabel: UILabel = {
        let titleLabel=UILabel()
        titleLabel.font=UIFont.systemFont(ofSize: 14)
        return titleLabel
    }()
    lazy var scrollLabel: UILabel = {
        let scrollLabel=UILabel()
        return scrollLabel
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView=UIImageView()
        bgImageView.isUserInteractionEnabled=true
        //bgImageView.backgroundColor=UIColor.white
        return bgImageView
    }()
    /***评论按钮***/
    lazy var commentButton: UIButton = {
        let commentButton=UIButton()
        commentButton.backgroundColor=UIColor.black
        commentButton.alpha=0.5
        commentButton.setTitleColor(UIColor.white, for: .normal)
        commentButton.layer.cornerRadius=20
        commentButton.setTitle("写评论...", for: .normal)
        commentButton.titleLabel?.textAlignment=NSTextAlignment.left
        return commentButton
    }()
      /***按钮集合***/
    lazy var CombinationVidew: THSmallVideoCombinationVidew = {
        let CombinationVidew=THSmallVideoCombinationVidew()
        return CombinationVidew
    }()
    lazy var closeBtn: UIButton = {
        let closebtn=UIButton()
        closebtn.setImage(UIImage.init(named: "ImgPic_close_24x24_"), for: .normal)
        closebtn.addTarget(THSmallVideoViewController(), action: #selector(closeAction), for: UIControl.Event.touchUpInside)
        return closebtn
    }()
   
    lazy var searchBtn: UIButton = {
        let searchBtn=UIButton()
        searchBtn.setImage(UIImage.init(named: "search_small_16x16_"), for: .normal)
        searchBtn.addTarget(self, action: #selector(searchBtnAction), for: UIControl.Event.touchUpInside)
        return searchBtn
    }()
    lazy var topShareBtn: UIButton = {
        let topShareBtn=UIButton()
        topShareBtn.setImage(UIImage.init(named: "new_morewhite_titlebar_22x22_"), for: .normal)
         topShareBtn.addTarget(self, action: #selector(topShareBtnAction), for: UIControl.Event.touchUpInside)
        return topShareBtn
    }()
    
    
    
}
//按钮方法
extension THSmallVideoCellCell{
    
}

//
//  THSmallVideoCombinationVidew.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/9.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THSmallVideoCombinationVidew: UIView {
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(WithPatBtn)
        self.addSubview(commentButton)
        self.addSubview(diggButton)
        self.addSubview(shareButton)
        
        let viewW=self.frame.size.width
        let viewH=self.frame.size.height
        var margeH=10
        
        
        WithPatBtn.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.top.equalToSuperview().offset(0)
            mask.width.equalTo(viewW)
            mask.height.equalTo(viewW)
        }
        diggButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.top.equalTo(WithPatBtn.snp_bottom).offset(margeH)
            mask.width.equalTo(viewW)
            mask.height.equalTo(viewW)
        }
        commentButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.top.equalTo(diggButton.snp_bottom).offset(margeH)
            mask.width.equalTo(viewW)
            mask.height.equalTo(viewW)
        }
        shareButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.top.equalTo(commentButton.snp_bottom).offset(margeH)
            mask.width.equalTo(viewW)
            mask.height.equalTo(viewW)
        }
    }
    
    
    lazy var WithPatBtn: UIButton = {
        let withb=UIButton()
        withb.addTarget(self, action: #selector(withPatBtnClick), for: UIControl.Event.touchUpInside)
        withb.setImage(UIImage.init(named: "feed_share_24x24_"), for: .normal)
        return withb
    }()
    
   
    /***评论***/
    lazy var commentButton: UIButton = {
        let commentButton=UIButton()
        commentButton.setImage(UIImage.init(named: "icon_details_comment_24x24_"), for: .normal)
        commentButton.addTarget(self
            , action:#selector(commentButtonAction), for: UIControl.Event.touchUpInside)
        return commentButton
    }()
    /****点赞***/
    lazy var diggButton: UIButton = {
        let diggButton=UIButton()
        diggButton.addTarget(self, action: #selector(diggButtonClick), for: UIControl.Event.touchUpInside)
        diggButton.setImage(UIImage.init(named: "hts_vp_like_24x24_"), for: .normal)
        return diggButton
    }()
     /****分享***/
    lazy var shareButton: UIButton = {
        let shareButton=UIButton()
        shareButton.setImage(UIImage.init(named: "icon_details_share_24x24_"), for: .normal)
        shareButton.addTarget(self, action: #selector(shareClick), for: UIControl.Event.touchUpInside)
        return shareButton
    }()
   

}
extension THSmallVideoCombinationVidew{
  @objc  func commentButtonAction()  {
        
    }
   @objc func diggButtonClick()  {
        
    }
    
   @objc func shareClick()  {
        
    }
 @objc   func withPatBtnClick()  {
        
    }
    
    
}

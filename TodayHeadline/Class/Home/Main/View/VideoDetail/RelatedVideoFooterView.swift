//
//  RelatedVideoFooterView.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/8/17.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class RelatedVideoFooterView: UIView {
    
    var  adModel = AD(){
        didSet{
            if self.adModel.app.ad_id != 0 {
                titleLable.text=self.adModel.app.title
                appNameLable.text=self.adModel.app.app_name
                if let urlList=self.adModel.app.image.url_list.first{
                    adImageView.kf.setImage(with: URL.init(string: urlList.url))
                }
            }else if self.adModel.mixed.id != 0{
                titleLable.text=self.adModel.mixed.title
                self.appNameLable.text=self.adModel.mixed.source_name
                if self.adModel.mixed.image != ""{
                    
                }else if self.adModel.mixed.image_list.count != 0{
                    if let image = adModel.mixed.image_list.first {
                        if let urlList = image.url_list.first {
                            adImageView.kf.setImage(with: URL(string: urlList.url)!)
                        }
                    }
                }
            }else{
                bgView.isHidden=true
            }
          }
    }
    
   /// 点击更多
   @objc  func moreClick() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(moreButton)
        addSubview(bgView)
      bgView.addSubview(titleLable)
       bgView.addSubview(appNameLable)
        bgView.addSubview(adImageView)
        bgView.addSubview(adLable)
        bgView.addSubview(downloadButton)
        moreButton.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.right.equalToSuperview().offset(-10)
            mask.top.equalToSuperview().offset(0)
            mask.height.equalTo(40)
        }
        titleLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.right.equalToSuperview().offset(-10)
            mask.top.equalTo(moreButton.snp_bottom).offset(5)
            mask.height.equalTo(30)
        }
        adImageView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.right.equalToSuperview().offset(-10)
            mask.top.equalTo(titleLable.snp_bottom).offset(0)
            mask.height.equalTo(screenWidth*0.5)
        }
        appNameLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.width.equalTo(60)
            mask.top.equalTo(adImageView.snp_bottom).offset(5)
            mask.bottom.equalToSuperview().offset(-5)
        }
        adLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(appNameLable.snp_left).offset(10)
            mask.width.equalTo(20)
            mask.top.equalToSuperview().offset(10)
            mask.height.equalTo(16)
        }
        downloadButton.snp.makeConstraints { (mask) in
            mask.width.equalTo(60)
            mask.right.equalToSuperview().offset(-20)
            mask.top.equalToSuperview().offset(5)
            mask.bottom.equalTo(-5)
        }
        
    }
    

    lazy var moreButton: UIButton = {
        let  moreButton=UIButton()
        moreButton.setTitle("查看更多", for: .normal)
        moreButton.setImage(UIImage.init(named: "arrow_down_16_16x14_"), for: .normal)
        moreButton.addTarget(self, action: #selector(moreClick), for: UIControl.Event.touchUpInside)
        
        return moreButton
    }()
    
    lazy var downloadButton: AnimatableButton = {
        let  downloadButton=AnimatableButton()
        downloadButton.setTitle("立即下载", for: .normal)
        downloadButton.layer.borderColor=UIColor.blueFontColor().cgColor
        downloadButton.titleLabel?.textColor=UIColor.blueFontColor()
        downloadButton.layer.borderWidth=1
        return downloadButton
    }()
    
    lazy var adImageView: UIImageView = {
        let adImageView=UIImageView()
        return adImageView
    }()
    lazy var titleLable: UILabel = {
        let titleLable=UILabel()
        titleLable.textColor=UIColor.black
        titleLable.font=UIFont.systemFont(ofSize: 16)
        return titleLable
    }()
    
    
    lazy var appNameLable: UILabel = {
        let appNameLable=UILabel()
        appNameLable.textColor=UIColor.gray
        appNameLable.font=UIFont.systemFont(ofSize: 16)
        return appNameLable
    }()
    lazy var adLable: UILabel = {
        let adLabl=UILabel()
        adLabl.text="广告"
        adLabl.textColor=UIColor.blueFontColor()
        adLabl.font=UIFont.systemFont(ofSize: 14)
        adLabl.layer.borderWidth=1
        adLabl.layer.borderColor=UIColor.gray.cgColor
        return adLabl
    }()
    
    lazy var bgView: UIView = {
        let bgView=UIView()
        return bgView
    }()
    
    
    

}

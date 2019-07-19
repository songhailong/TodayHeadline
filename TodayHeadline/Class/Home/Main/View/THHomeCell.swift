//
//  THHomeCell.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/7/1.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import SnapKit
let image3Width: CGFloat = (screenWidth - 40) / 3
class THHomeCell: UITableViewCell {
    var textmodel=THTexstsModel(){
        didSet{
            //现在不做判断
            downLoadBtn.setImage(nil
                , for: .normal)
            topImageView.image=nil
            rightImageview.image=nil
            videoImageButton.setImage(nil, for: .normal)
            titleLable.text=self.textmodel.title
            collectionView.removeFromSuperview()
            if middleView.subviews.count != 0 {
                videoImageButton.removeFromSuperview()
              
            }
            BootomView.snp.updateConstraints { (mask) in
                mask.height.equalTo(0)
            }
            downLoadBtn.setTitle("", for: .normal)
            if self.textmodel.media_name != ""{
                nameLable.text=self.textmodel.media_name
            }else if self.textmodel.media_info.media_id != 0{
                 nameLable.text=self.textmodel.media_info.name
            }else if self.textmodel.user_info.user_id != 0{
                nameLable.text=self.textmodel.user_info.name
            }
            
       commentLabl.text=self.textmodel.commentCount+"评论"
       releaseTimeLable.text=self.textmodel.publishTime
            //热点
           adOrHotLable.textColor=UIColor.globalRedColor()
           adOrHotLable.borderColor = .globalRedColor()
           adOrHotLable.text=self.textmodel.label
            if self.textmodel.hot{
                adOrHotLable.text = "热"
                self.adOrHotLable.snp.updateConstraints { (mask) in
                    mask.width.equalTo(25)
                }
                //adOrHotLabelWidth.constant = 20
                //nameLabelLeading.constant = 25
            }else if self.textmodel.is_stick||self.textmodel.label=="直播"||self.textmodel.label=="直播"{
                
            }else if  self.textmodel.label_style == .ad{
                //广告
               adOrHotLable.textColor = .blueFontColor()
                adOrHotLable.borderColor = .lightGray
                if self.textmodel.sub_title != ""{
                    subTitleLable.text=self.textmodel.sub_title
                    downLoadBtn.setImage(UIImage.init(named: "download_ad_feed_13x13_"), for: .normal)
                    self.BootomView.snp.updateConstraints { (mask) in
                        mask.height.equalTo(40)
                    }
                }else{
                    adOrHotLable.text = ""
                    self.adOrHotLable.snp.updateConstraints { (mask) in
                        mask.width.equalTo(0)
                    }
                }
            }
            
            //视频和图片的摆放
            
            if self.textmodel.video_duration != 0 && self.textmodel.has_video{
                //视频
                if self.textmodel.video_style == 0{
                    //右侧
                    rightTimeButton.setTitle(self.textmodel.videoDuration, for: .normal)
                    rightTimeButton.snp.updateConstraints { (mask) in
                        mask.width.equalTo(50)}
                    rightImageview.snp.updateConstraints { (mask) in
                        mask.width.equalTo(screenWidth*0.28)
                    }
                    //右面图片的设置
                    if let image = self.textmodel.image_list.first {
                        rightImageview.kf.setImage(with: URL(string: image.urlString)!)
                    } else if self.textmodel.middle_image.url.length > 0 {
                       rightImageview.kf.setImage(with: URL(string: self.textmodel.middle_image.urlString)!)
                    } else if let largeImage = self.textmodel.large_image_list.first {
                        rightImageview.kf.setImage(with: URL(string: largeImage.urlString)!)
                    }
                        
                    
                }else if self.textmodel.video_style == 2{
                    //大图
                    middleView.snp.updateConstraints { (mask) in
                      mask.height.equalTo(screenWidth*0.5)
                        
                    }
                    if let largeImage = self.textmodel.large_image_list.first {
                        videoImageButton.setImage(UIImage(named: "video_play_icon_44x44_"), for: .normal)
                        videoImageButton.kf.setBackgroundImage(with: URL(string: largeImage.urlString)!, for: .normal)
                    }
                    //h可能会cellg复用所以先删除
                    middleView.addSubview(videoImageButton)
                     setupRightImageView()
                }
                
            }else{
                //没有视频
                if self.textmodel.middle_image.url != "" && self.textmodel.image_list.count == 0{
                    //把中间的显示在了 右面
                    rightImageview.kf.setImage(with: URL.init(string: self.textmodel.middle_image.urlString))
                    rightImageview.snp.updateConstraints { (mask) in
                        mask.width.equalTo(screenWidth*0.28)
                    }
                }else{
                  setupRightImageView()
                  
                    if self.textmodel.image_list.count == 1 { // 右侧显示图片
                        
                        rightImageview.snp.updateConstraints { (mask) in
                            mask.width.equalTo(screenWidth*0.28)
                        }
                        
                        rightImageview.kf.setImage(with: URL.init(string: self.textmodel.image_list.first?.urlString ?? ""))
                        
                    } else {
                       
                        self.middleView.snp.updateConstraints { (mask) in
                            mask.height.equalTo(image3Width)
                        }
                       middleView.addSubview(collectionView)
                        collectionView.frame = CGRect(x: 0, y: 0, width: screenWidth - 30, height: image3Width)
                        collectionView.images = self.textmodel.image_list
                    }
                    
                    
                }
                
            }
            
            
            
            
            
            
            
            }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          configUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupAdLabel() {
        //adOrHotLabelWidth.constant = 32
       // nameLabelLeading.constant = 37
    }
    func setupRightImageView() {
        rightTimeButton.snp.updateConstraints { (mask) in
            mask.width.equalTo(0)
        }
        rightImageview.snp.updateConstraints { (mask) in
            mask.width.equalTo(0)
        }
        
        rightTimeButton.setTitle("", for: .normal)
    }
    
    func configUI()  {
        self.contentView.addSubview(self.rightImageview)
        self.contentView.addSubview(self.rightTimeButton)
        self.contentView.addSubview(self.removeButton)
        self.contentView.addSubview(self.topImageView)
        self.contentView.addSubview(self.titleLable)
        self.contentView.addSubview(self.adOrHotLable)
        self.contentView.addSubview(self.nameLable)
        self.contentView.addSubview(self.commentLabl)
        self.contentView.addSubview(self.middleView)
        self.contentView.addSubview(self.releaseTimeLable)
        self.contentView.addSubview(self.BootomView)
        self.contentView.addSubview(self.subTitleLable)
        self.contentView.addSubview(self.downLoadBtn)
        self.contentView.addSubview(self.videoImageButton)
        setlayoutConstrains()
    }
    
    func setlayoutConstrains()  {
        self.BootomView.snp.makeConstraints { (mask) in
            //mask.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 5, left: 15, bottom: 5, right: 15))
            mask.left.equalToSuperview().offset(15)
            mask.right.equalToSuperview().offset(-15)
            mask.bottom.equalToSuperview().offset(0)
            mask.height.equalTo(0)
            
        }
        self.adOrHotLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.bottom.equalToSuperview().offset(-5.5)
            mask.width.equalTo(20)
            mask.height.equalTo(15)
        }
        self.nameLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(self.adOrHotLable.snp_right).offset(0)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.equalTo(80)
            mask.height.equalTo(16)
        }
        self.commentLabl.snp.makeConstraints { (mask) in
            mask.left.equalTo(self.nameLable.snp_right).offset(5)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.equalTo(60)
            mask.height.equalTo(16)
        }
        self.releaseTimeLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(self.commentLabl.snp_right).offset(5)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.equalTo(54)
            mask.height.equalTo(16)
        }
        self.middleView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.right.equalToSuperview().offset(-5)
           
            mask.height.equalTo(1)
            mask.top.equalTo(self.titleLable.snp_bottom).offset(5)
        }
        self.titleLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.right.equalTo(self.rightImageview.snp_left).offset(-5)
            mask.top.equalTo(self.topImageView.snp_bottom).offset(5)
            mask.bottom.equalTo(self.middleView.snp_top).offset(-5)
        }
        self.topImageView.snp.makeConstraints { (mask) in
            mask.top.equalToSuperview().offset(10)
            mask.left.equalToSuperview().offset(15)
            mask.right.equalTo(self.rightImageview.snp_left).offset(10)
            mask.bottom.equalTo(self.titleLable.snp_top).offset(-5)
        }
        self.removeButton.snp.makeConstraints { (mask) in
            mask.width.equalTo(17)
            mask.height.equalTo(15)
            mask.bottom.equalToSuperview().offset(-5)
            mask.right.equalTo(self.rightImageview.snp_left).offset(-5)
        }
        
        self.rightTimeButton.snp.makeConstraints { (mask) in
            mask.width.equalTo(0)
            mask.height.equalTo(22)
            mask.right.equalTo(self.rightImageview)
            mask.bottom.equalTo(self.rightImageview)
        }
        self.rightImageview.snp.makeConstraints { (mask) in
            mask.top.equalToSuperview().offset(10)
            mask.height.equalTo(65)
            mask.width.equalTo(0)
            mask.right.equalToSuperview().offset(-15)
        }
        
        self.subTitleLable.snp.makeConstraints { (mask) in
            mask.width.equalTo(35)
            mask.left.equalToSuperview().offset(15)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.equalTo(10)
        }
        
        self.downLoadBtn.snp.makeConstraints { (mask) in
            mask.width.equalTo(90)
            mask.left.equalToSuperview().offset(15)
            mask.bottom.equalToSuperview().offset(0)
            mask.top.equalTo(0)
        }
        
        
        
        
        
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
  @objc  func removeBtnClick()  {
        
    }
    
    
  @objc  func downLoadClick()  {
        
    }
    
    /**懒加载cellection**/
    private lazy var collectionView = HomeImageCollectionView.loadViewFromNib()
    //懒加载
    /**标题顶部**/
    lazy var topImageView: UIImageView! = {
        let topimageview=UIImageView.init()
        
        return topimageview
    }()
    /***标题**/
    lazy var titleLable: UILabel = {
        let titleLable=UILabel.init()
        titleLable.textColor=UIColor.black
        titleLable.font=UIFont.systemFont(ofSize: 17)
        titleLable.numberOfLines=0
        return titleLable
    }()
    /***广告**/
    lazy var adOrHotLable: AnimatableLabel = {
        let hotLable=AnimatableLabel()
        hotLable.cornerRadius=4
        hotLable.borderColor=UIColor.RGBColor(R: 234, G: 57, B: 72)
        return hotLable
    }()
    /**名字*/
    lazy var nameLable: UILabel = {
        let nameLable = UILabel()
        nameLable.text="用户名"
        nameLable.font=UIFont.systemFont(ofSize: 13)
        nameLable.textColor=UIColor.RGBColor(R: 170, G: 170, B: 170)
        return nameLable
    }()
    /*品论数量*/
    lazy var commentLabl: UILabel = {
        let commentLabl=UILabel()
        commentLabl.text="评论数量"
        commentLabl.font=UIFont.systemFont(ofSize: 13)
        commentLabl.textColor=UIColor.RGBColor(R: 170, G: 170, B: 170)
        return commentLabl
    }()
    /**发布时间**/
    lazy var releaseTimeLable: UILabel = {
        let releaseTimeLable = UILabel()
        releaseTimeLable.text="发布时间"
        releaseTimeLable.font=UIFont.systemFont(ofSize: 13)
        releaseTimeLable.textColor=UIColor.RGBColor(R: 170, G: 170, B: 170)
        return releaseTimeLable
    }()
    /***右面图片**/
    lazy var rightImageview: UIImageView = {
        let rightImageview=UIImageView()
        rightImageview.backgroundColor=UIColor.red
        return rightImageview
    }()
    
    lazy var rightTimeButton: UIButton = {
        let rightTimeButton=UIButton()
        rightTimeButton.titleLabel?.font=UIFont.systemFont(ofSize: 13)
        rightTimeButton.setImage(UIImage.init(named: "palyicon_video_textpage_6x8_"), for: UIControl.State.normal)
        return rightTimeButton
    }()
    
    /**删除按钮***/
    lazy var removeButton: UIButton = {
          let removeBtn=UIButton()
        removeBtn.addTarget(self, action: #selector(removeBtnClick), for: UIControl.Event.touchUpInside)
        removeBtn.setImage(UIImage.init(named: "add_textpage_17x12_"), for: UIControl.State.normal)
        return removeBtn
    }()
    /**中间内容**/
    lazy var middleView: UIView = {
        let middleView=UIView()
        
        return middleView
    }()
    /**底部控件**/
    lazy var BootomView: UIView = {
        let bootmView=UIView()
        return bootmView
    }()
    /***底部标题**/
    lazy var subTitleLable: UILabel = {
        let TitleLable=UILabel()
        TitleLable.font=UIFont.systemFont(ofSize: 15)
        TitleLable.textColor=UIColor.RGBColor(R: 170, G: 170, B: 170)
        return TitleLable
    }()
    /***下载按钮**/
    lazy var downLoadBtn: UIButton = {
        let downLoadBtn=UIButton()
        downLoadBtn.addTarget(self, action: #selector(downLoadClick), for: UIControl.Event.touchUpInside)
        return downLoadBtn
    }()
    /// 视频大图
    lazy var videoImageButton: UIButton = {
        let videoImageButton = UIButton()
        
        return videoImageButton
    }()
    
    
    

}
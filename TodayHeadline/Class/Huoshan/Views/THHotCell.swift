//
//  THHotCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/8.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHotCell: UICollectionViewCell {
    
    var smallVideo=THTexstsModel(){
        didSet{
            if let firstImage = self.smallVideo.raw_data.first_frame_image_list.first {
                previewImageView.kf.setImage(with: URL(string: firstImage.urlString)!)
                print(firstImage.urlString)
            }else if let largeImage = self.smallVideo.raw_data.large_image_list.first{
                print("图片和GV阿uvdvabiugaiudb\(largeImage.url)")
                previewImageView.kf.setImage(with: URL(string:largeImage.urlString))
            }
            
           diggCountLabel.text = self.smallVideo.raw_data.action.diggCount + "赞"
            playCountButton.setTitle(self.smallVideo.raw_data.action.playCount + "次播放", for: .normal)
            titleLable.text=self.smallVideo.raw_data.title
            
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //func  creatUI(){
        
//        self.addSubview(self.previewImageView)
//        self.addSubview(self.titleLable)
//        self.addSubview(self.diggCountLabel)
//        self.addSubview(self.playCountButton)
//        self.addSubview(self.closeButton)
    //}
    override func layoutSubviews() {
        super.layoutSubviews()
            self.contentView.addSubview(self.previewImageView)
            self.contentView.addSubview(self.titleLable)
            self.contentView.addSubview(self.diggCountLabel)
            self.contentView.addSubview(self.playCountButton)
            self.contentView.addSubview(self.closeButton)
        self.previewImageView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(0)
            mask.top.equalToSuperview().offset(0)
            mask.bottom.equalToSuperview().offset(-2)
        }
        self.titleLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.right.equalToSuperview().offset(-15)
           mask.height.equalTo(40)
            mask.bottom.equalTo(self.playCountButton.snp_top).offset(0)
        }
        self.diggCountLabel.snp.makeConstraints { (mask) in
          
            mask.right.equalToSuperview().offset(-15)
            mask.height.equalTo(30)
            mask.width.equalTo(80)
            mask.bottom.equalToSuperview().offset(-10)
        }
        self.playCountButton.snp.makeConstraints { (mask) in
            
            mask.right.equalTo(self.diggCountLabel.snp_left).offset(0)
            mask.height.equalTo(30)
            mask.left.equalToSuperview().offset(10)
            mask.bottom.equalToSuperview().offset(-10)
        }
        self.closeButton.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-10)
            mask.height.equalTo(40)
            mask.width.equalTo(40)
            mask.top.equalToSuperview().offset(10)
        }
        
        
        
        
        
    }
    
    
    
    
 @objc   func closeButtonAction()  {
        
    }
    
    
    
    //MARK 懒加载
    lazy var previewImageView: UIImageView = {
        let imageview=UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds=true
        return imageview
    }()
    lazy var titleLable: UILabel = {
        let titleLbale=UILabel()
        titleLbale.font=UIFont.systemFont(ofSize: 16)
        titleLbale.textColor=UIColor.white
        return titleLbale
    }()
    //赞
    lazy var diggCountLabel: UILabel = {
        let diggCountLabel=UILabel()
        diggCountLabel.font=UIFont.systemFont(ofSize: 12)
        diggCountLabel.textColor=UIColor.white
        diggCountLabel.textAlignment=NSTextAlignment.right
        return diggCountLabel
    }()
    lazy var  playCountButton: UIButton = {
        let butt=UIButton()
        butt.titleLabel?.font=UIFont.systemFont(ofSize: 12)
        butt.setTitleColor(UIColor.white, for: .normal)
        butt.setImage(UIImage.init(named: "ugc_video_list_play_32x32_"), for: .normal)
        return butt
    }()
    lazy var closeButton: UIButton = {
        let closeButton=UIButton()
        closeButton.setImage(UIImage.init(named: "ImgPic_close_24x24_"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: UIControl.Event.touchUpInside)
        return closeButton
    }()
    
    
    
}

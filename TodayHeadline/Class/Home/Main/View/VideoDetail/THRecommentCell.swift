//
//  THRecommentCell.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/8/17.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THRecommentCell: UITableViewCell {
    
    var relatedVideo = THTexstsModel(){
        didSet{
            titleLable.text = relatedVideo.title
            nameLable.text = relatedVideo.source
             videoImageView.kf.setImage(with: URL(string: relatedVideo.middle_image.urlString)!)
            
            if relatedVideo.video_detail_info.video_watch_count != 0 {
                palyCountLable.text = relatedVideo.video_detail_info.videoWatchCount + "次播放"
            } else { palyCountLable.isHidden = true }
            
            
            timetLable.text = relatedVideo.videoDuration
            timetLable.isHidden = !relatedVideo.has_video
            switch relatedVideo. {
            case .video:    // 视频
                adLable.isHidden = true
                //nameLabelLeading.constant = 0
            case .adVideo:  // 广告视频
                adLabel.isHidden = false
                nameLabelLeading.constant = 37.0
            case .adTextlink:  // 广告链接
                thumbImageViewWidth = NSLayoutConstraint(item: thumbImageView, attribute: .width, relatedBy: .equal, toItem: thumbImageView.superview, attribute: .width, multiplier: 0, constant: 0)
                adLabel.isHidden = false
                timeLabel.isHidden = true
                playCountLabel.isHidden = true
                nameLabelLeading.constant = 37.0
            }
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(titleLable)
        contentView.addSubview(adLable)
        contentView.addSubview(videoImageView)
        contentView.addSubview(nameLable)
        contentView.addSubview(palyCountLable)
        videoImageView.addSubview(timetLable)
        titleLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(10)
            mask.top.equalToSuperview().offset(5)
            mask.height.equalTo(50)
            mask.right.equalTo(videoImageView.snp_left).offset(5)
        }
        videoImageView.snp.makeConstraints { (mask) in
            mask.width.equalTo(65*1.6)
            mask.top.equalToSuperview().offset(5)
            mask.height.equalTo(65)
            mask.right.equalToSuperview().offset(-10)
        }
        
        timetLable.snp.makeConstraints { (mask) in
            mask.width.equalTo(50)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.equalTo(20)
            mask.right.equalToSuperview().offset(-5)
        }
        
        adLable.snp.makeConstraints { (mask) in
            mask.width.equalTo(0)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.equalTo(16)
            mask.left.equalToSuperview().offset(10)
        }
        nameLable.snp.makeConstraints { (mask) in
            mask.width.equalTo(0)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.equalTo(16)
            mask.left.equalTo(adLable.snp_right).offset(10)
        }
        palyCountLable.snp.makeConstraints { (mask) in
            mask.width.equalTo(0)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.equalTo(16)
            mask.left.equalTo(nameLable.snp_right).offset(10)
        }
        
    }
    
    
    
    
     //推荐视频cell
    lazy var titleLable: UILabel = {
        let titleBle=UILabel()
        titleBle.textColor=UIColor.black
        return titleBle
    }()
    
    lazy var adLable: UILabel = {
        let adLable=UILabel()
    adLable.layer.borderWidth=1
    adLable.text="广告"
     adLable.textColor=UIColor.gray
        return adLable
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable=UILabel()
        nameLable.font=UIFont.systemFont(ofSize: 14)
        nameLable.textColor=UIColor.gray
        return nameLable
    }()
    lazy var palyCountLable: UILabel = {
        let palyCountLable=UILabel()
        palyCountLable.font=UIFont.systemFont(ofSize: 14)
        palyCountLable.textColor=UIColor.gray
        return palyCountLable
    }()
    lazy var timetLable: UILabel = {
        let timetLable=UILabel()
        timetLable.font=UIFont.systemFont(ofSize: 12)
       timetLable.textColor=UIColor.white
        timetLable.backgroundColor=THRGBColor(R: 110, G: 122, B: 132)
        
        return timetLable
    }()
    lazy var videoImageView: UIImageView = {
        let videoImageView=UIImageView()
     
        
        return videoImageView
    }()
}

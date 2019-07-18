//
//  THHomeImageCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/18.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHomeImageCell: UITableViewCell {
    
    var homeImage = THTexstsModel(){
        didSet{
            if self.homeImage.gallary_image_count>0{
                imageCountLabel.text="\(homeImage.gallary_image_count)图"
            }
            imageTitleLabel.text = homeImage.title
            timeLabel.text = homeImage.commentCount + "评论"
            if homeImage.media_info.user_id != 0 { usernameLabel.text = homeImage.media_info.name }
            if let firstImage = homeImage.image_list.first {
                bgImageView.kf.setImage(with: URL(string: firstImage.urlString)!)
            }
            imageTitleLabel.snp.updateConstraints { (mask) in
                mask.height.equalTo(homeImage.titleH)
            }
            view.snp.makeConstraints { (mask) in
                mask.height.equalTo(homeImage.titleH+50)
            }
            
            
            
        }
    }
    
    
 
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
       connfigUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func connfigUI() {
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(view)
        bgImageView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
              mask.right.equalToSuperview().offset(0)
              mask.top.equalToSuperview().offset(0)
              mask.height.equalTo(screenWidth*9.0/16.0)
        }
        
        bgImageView.addSubview(imageCountLabel)
        imageCountLabel.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-5)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.equalTo(45)
            mask.height.equalTo(25)
        }
        view.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(0)
            mask.top.equalTo(bgImageView.snp_bottom).offset(0)
            mask.height.equalTo(70)
        }
        view.addSubview(imageTitleLabel)
        imageTitleLabel.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(0)
            mask.top.equalToSuperview().offset(0)
            mask.height.equalTo(20)
        }
        view.addSubview(usernameLabel)
        view.addSubview(timeLabel)
         view.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-5)
            mask.bottom.equalToSuperview().offset(-5)
            mask.width.equalTo(17)
            mask.height.equalTo(14)
        }
        timeLabel.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-5)
            mask.left.equalToSuperview().offset(0)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.equalTo(30)
        }
        
        usernameLabel.snp.makeConstraints { (mask) in
            mask.right.equalTo(timeLabel.snp_left).offset(-5)
            mask.left.equalToSuperview().offset(0)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.equalTo(30)
        }
        
        
        
        
    }
    
    lazy var bgImageView: UIImageView = {
        let imageview=UIImageView()
        return imageview
    }()
    lazy var imageCountLabel: UILabel = {
        let imageCountLabel=UILabel()
        imageCountLabel.font=UIFont.systemFont(ofSize: 13)
        imageCountLabel.textColor = UIColor.white
        return imageCountLabel
    }()
    lazy var imageTitleLabel: UILabel = {
        let imageTitleLabel=UILabel()
        imageTitleLabel.font=UIFont.systemFont(ofSize: 16)
        imageTitleLabel.textColor=UIColor.black
        return imageTitleLabel
    }()
    lazy var usernameLabel: UILabel = {
        let usernameLabel=UILabel()
        usernameLabel.font=UIFont.systemFont(ofSize: 13)
        usernameLabel.textColor=UIColor.lightGray
        return usernameLabel
    }()
    lazy var timeLabel: UILabel = {
        let timeLabel=UILabel()
        timeLabel.font=UIFont.systemFont(ofSize: 13)
        timeLabel.textColor=UIColor.lightGray
        return timeLabel
    }()
    
    
    lazy var view: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var closeBtn: UIButton = {
        let closeBtn = UIButton()
          closeBtn.setImage(UIImage.init(named: "add_textpage_17x12_"), for: .normal)
        return closeBtn
    }()
    
    
    
}

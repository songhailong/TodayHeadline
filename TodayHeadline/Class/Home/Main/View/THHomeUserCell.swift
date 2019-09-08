//
//  THHomeUserCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/4.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import Kingfisher
class THHomeUserCell: UITableViewCell {
    var textModel = THTexstsModel(){
        didSet{
            if textModel.source != "" {
              nameLable.text=textModel.source
            }else if self.textModel.user.user_id != 0{
                //iconImageview.kf.setImage(with: URL.init(string: self.textModel.user.avatar_url))
                iconImageview.sd_setImage(with: URL.init(string: self.textModel.user.avatar_url), completed: nil)
                 nameLable.text = self.textModel.user.screen_name
            }else if self.textModel.user_info.user_id != 0{
                //iconImageview.kf.setImage(with: URL.init(string: self.textModel.user_info.avatar_url))
                 iconImageview.sd_setImage(with: URL.init(string: self.textModel.user_info.avatar_url), completed: nil)
                  nameLable.text = self.textModel.user_info.name
            }else if self.textModel.media_info.user_id != 0 {
                nameLable.text = self.textModel.media_info.name
                 //iconImageview.kf.setImage(with: URL.init(string: self.textModel.media_info.avatar_url)!)
                iconImageview.sd_setImage(with: URL.init(string: self.textModel.media_info.avatar_url)!, completed: nil)
            }
            
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        conFigUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func conFigUI()  {
        self.contentView.addSubview(self.topView)
        self.contentView.addSubview(self.BootomView)
        self.contentView.addSubview(self.contentLable)
        self.topView.addSubview(iconImageview)
        self.iconImageview.addSubview(vipImageView)
        self.topView.addSubview(nameLable)
        self.topView.addSubview(introduceLable)
        self.topView.addSubview(ConcernBtn)
        self.topView.addSubview(colesBtn)
        self.BootomView.addSubview(digButton)
        self.BootomView.addSubview(commentButton)
        self.BootomView.addSubview(feedShareButton)
        self.BootomView.addSubview(self.readCountLable)
        
        self.topView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(0)
            mask.top.equalToSuperview().offset(0)
            mask.height.equalTo(70)
        }
        
        
        self.iconImageview.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.top.equalToSuperview().offset(10)
            mask.height.width.equalTo(50)
        }
        self.vipImageView.snp.makeConstraints { (mask) in
            mask.right.equalToSuperview().offset(-5)
            mask.bottom.equalToSuperview().offset(-5)
            mask.height.width.equalTo(15)
        }
        self.nameLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(iconImageview.snp_right).offset(5)
            mask.top.equalToSuperview().offset(10)
            mask.height.equalTo(25)
            mask.right.equalTo(ConcernBtn.snp_left).offset(0)
        }
        self.introduceLable.snp.makeConstraints { (mask) in
            mask.left.equalTo(iconImageview.snp_right).offset(5)
            mask.top.equalToSuperview().offset(35)
            mask.height.equalTo(25)
            mask.right.equalTo(ConcernBtn.snp_left).offset(0)
        }
        self.colesBtn.snp.makeConstraints { (mask) in
            mask.centerY.equalTo(self.topView)
            mask.width.equalTo(20)
            mask.height.equalTo(14)
            mask.right.equalToSuperview().offset(-15)
        }
        self.ConcernBtn.snp.makeConstraints { (mask) in
            mask.centerY.equalTo(self.topView)
            mask.width.equalTo(40)
            mask.height.equalTo(30)
            mask.right.equalTo(colesBtn.snp_left).offset(0)
            
        }
        
        
        self.contentLable.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(15)
            mask.right.equalToSuperview().offset(-15)
            mask.top.equalTo(topView.snp_bottom).offset(0)
            mask.bottom.equalTo(BootomView.snp_top).offset(0)
        }
        self.BootomView.snp.makeConstraints { (mask) in
            mask.left.equalToSuperview().offset(0)
            mask.right.equalToSuperview().offset(0)
            mask.height.equalTo(55)
            mask.bottom.equalToSuperview().offset(0)
        }
        self.digButton.snp.makeConstraints { (mask) in
            mask.bottom.equalToSuperview().offset(0)
            mask.left.equalToSuperview().offset(0)
           
            mask.height.equalTo(35)
             mask.width.equalTo(screenWidth/3)
        }
        self.commentButton.snp.makeConstraints { (mask) in
            mask.bottom.equalToSuperview().offset(0)
            mask.left.equalTo(digButton.snp_right).offset(0)
            mask.height.equalTo(35)
            mask.width.equalTo(screenWidth/3)
        }
        self.ConcernBtn.snp.makeConstraints { (mask) in
            mask.bottom.equalToSuperview().offset(0)
            mask.left.equalTo(commentButton.snp_right).offset(0)
            mask.height.equalTo(35)
            mask.width.equalTo(screenWidth/3)
        }
        self.readCountLable.snp.makeConstraints { (mask) in
            mask.top.equalToSuperview().offset(0)
            mask.left.right.equalToSuperview().offset(0)
            mask.bottom.equalTo(ConcernBtn.snp_top).offset(0)
            
        }
        
        
        
        
    }
    
    
    
    
    lazy var topView:UIView={
        let topview=UIView()
        return topview
    }()
    lazy var BootomView:UIView={
        let BootomView=UIView()
        return BootomView
    }()
    lazy var contentLable:UILabel={
        let contentLable=UILabel()
        contentLable.textColor=UIColor.black
        contentLable.font=UIFont.systemFont(ofSize: 16)
        contentLable.numberOfLines=0
        return contentLable
    }()
    //头像
    lazy var iconImageview: UIImageView = {
        let conImageview=UIImageView()
        return conImageview
    }()
    lazy var vipImageView: UIImageView = {
        let vipImage=UIImageView()
        vipImage.image=UIImage.init(named: "all_v_avatar_star_16x16_")
        return vipImage
    }()
    
    lazy var nameLable: UILabel = {
        let namelable=UILabel()
        namelable.textColor=UIColor.black
        namelable.font=UIFont.systemFont(ofSize: 17)
        return namelable
    }()
    
    lazy var introduceLable: UILabel = {
        let introduceLable=UILabel()
        introduceLable.textColor=UIColor.black
        introduceLable.font=UIFont.systemFont(ofSize: 17)
        return introduceLable
    }()
    
    lazy var ConcernBtn: UIButton = {
        let ConcernBtn=UIButton()
        ConcernBtn.setImage(UIImage.init(named:"add_textpage_17x12_"), for: .normal)
        return ConcernBtn
    }()
    
    lazy var colesBtn: UIButton = {
        let closebtn=UIButton()
        closebtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        closebtn.titleLabel?.text="关注"
        closebtn.setTitleColor(UIColor.init(r: 81, g: 175, b: 250), for: .normal)
        return closebtn
    }()
    
    
    lazy var digButton: UIButton = {
        let digButton=UIButton()
        digButton.setImage(UIImage.init(named: "like_old_feed_24x24_"), for: .normal)
        digButton.setTitle("赞", for: .normal)
        return digButton
    }()
    lazy var commentButton: UIButton = {
        let commentButton=UIButton()
        commentButton.setImage(UIImage.init(named: "comment_24x24_"), for: .normal)
        commentButton.setTitle("评论", for: .normal)
        return commentButton
    }()
    lazy var feedShareButton: UIButton = {
        let feedShareButton=UIButton()
        feedShareButton.setImage(UIImage.init(named: "feed_share_24x24_"), for: .normal)
        feedShareButton.setTitle("转发", for: .normal)
        return feedShareButton
    }()
    
    lazy var readCountLable: UILabel = {
        let readCountLable=UILabel()
        readCountLable.textColor=UIColor.gray
        return readCountLable
    }()
    
    
    
    
    
    
    
    

}

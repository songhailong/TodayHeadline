//
//  THNavigateView.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/6/28.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import SpriteKit
class THNavigateView: UIView {
    /// 搜索按钮点击
    var didSelectSearchButton: (()->())?
    /// 头像按钮点击
    var didSelectAvatarButton: (()->())?
    /// 相机按钮点击
    var didSelectCameraButton: (()->())?
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI()  {
        
        print(screenWidth)
        
       self.addSubview(self.backView)
       
       self.backView.addSubview(self.searchButton)
        self.searchButton.frame=CGRect.init(x: CGFloat(20), y:stausHeight, width: screenWidth-80, height: NavHeight-stausHeight-7)
       self.backView.addSubview(self.cameraButton)
        self.cameraButton.frame=CGRect.init(x: screenWidth-35, y: CGFloat(stausHeight), width: 30, height: 30)
        //self.cameraButton.backgroundColor=UIColor.white
//      self.cameraButton.x=screenWidth-35
//      self.cameraButton.y=CGFloat(stausHeight)
//      self.cameraButton.width=30
//      self.cameraButton.height=30
        
        
    }
    
    
    
    
    
  @objc  func searchButtonClicked(_ sender: AnimatableButton){
        didSelectSearchButton?()
    }
  @objc  func cameraButtonClicked(sender:UIButton) {
       didSelectCameraButton?()
    }
    
    
    //MARK 懒加载
    lazy var searchButton: AnimatableButton = {
        let searchButton=AnimatableButton()
        
        searchButton.setImage(UIImage.init(named: "search_small_16x16_"), for: .normal)
        
       
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: UIControl.Event.touchDragInside)
        searchButton.backgroundColor=UIColor.white
     
        searchButton.titleLabel?.font=UIFont.systemFont(ofSize: 15)
        searchButton.titleLabel?.textColor=UIColor.gray
        return searchButton
    }()
    
    lazy var cameraButton: UIButton = {
        let cameraButton=UIButton.init()
    
        cameraButton.setImage(UIImage.init(named: "short_video_publish_icon_camera_24x24_"), for: .normal)
          let image1=UIImage.init(named: "short_video_publish_icon_camera_24x24_")
        print("相机\(String(describing: image1))")
        cameraButton.addTarget(self, action: #selector(cameraButtonClicked), for: UIControl.Event.touchDragInside)
        return cameraButton
    }()
    
    lazy var backView: UIView = {
        let backView=UIView.init()
        backView.frame=CGRect.init(x: 0, y: 0, width: Int(screenWidth), height: Int(NavHeight))
        backView.backgroundColor=UIColor.RGBColor(R:245,G: 90,B: 93)
        return backView
    }()
    
    
}

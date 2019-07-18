//
//  THTabBarController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/6/26.
//  Copyright © 2019年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        //tabbar.
        
       initTabbarControls()
    }
    
    func initTabbarControls()  {
        setChildViewControl(childController: THHomeViewController(), title: "首页", image: "home_tabbar", selectedImage: "home_tabbar_press")
        setChildViewControl(childController: THWatermelonViewController(), title: "西瓜视频", image: "video_tabbar", selectedImage: "video_tabbar_press")
        setChildViewControl(childController: TBShortVideoViewController(), title: "小视频", image: "huoshan_tabbar", selectedImage: "huoshan_tabbar_press")
        setChildViewControl(childController: TBMineViewController(), title: "我的", image: "weitoutiao_tabbar", selectedImage: "weitoutiao_tabbar_press")
    }
    
    private func setChildViewControl(childController:UIViewController,title:String,image:String,selectedImage: String){
        let item=UITabBarItem()
        item.image=UIImage.init(named: image)
        item.selectedImage=UIImage.init(named: selectedImage)
        item.title=title
        let selectAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 10),.foregroundColor: UIColor(red: 0.97, green: 0.35, blue: 0.35, alpha: 1)]
        item.setTitleTextAttributes(selectAttributes, for: .selected)
        childController.tabBarItem=item
        childController.title=title
        let naController=UINavigationController.init(rootViewController: childController)
        addChild(naController)
    }
   

}

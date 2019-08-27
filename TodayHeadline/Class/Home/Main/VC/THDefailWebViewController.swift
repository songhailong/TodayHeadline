//
//  THDefailWebViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/15.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THDefailWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let webv=THWebView.shareManager()
        let ddd=THWebView.shareManager()
        let sssss=THWebView.shareManager()
        let eeeee=THWebView.shareManager()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden=true
        
        self.view.addSubview(cutemNative)
        self.view.addSubview(bottom)
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    func configUI()  {
        self.view.addSubview(bottom)
    }
    
    
   @objc func leftAction()  {
        self.navigationController?.popViewController(animated: true)
    }
    
  @objc  func rightAction()  {
        
    }
    
    lazy var bottom: THVideoDefailBottomView = {
        let bottom=THVideoDefailBottomView.init(frame: CGRect.init(x: 0, y: screenHeight-50, width: screenWidth, height: 50))
        bottom.backgroundColor=UIColor.red
        return bottom
    }()
    lazy var cutemNative: THCustemNativeView = {
        let  cutemNative=THCustemNativeView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: NavHeight))
        cutemNative.leftButton.addTarget(self, action: #selector(leftAction), for: UIControl.Event.touchUpInside)
        cutemNative.rightButton.addTarget(self, action: #selector(rightAction), for: UIControl.Event.touchUpInside)
        return cutemNative
    }()
    
   
    
    
  

}

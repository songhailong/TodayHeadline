//
//  THWebView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/27.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import WebKit
class THWebView:UIView {
    
    var custwebView:WKWebView=WKWebView()
    
  private static let  webViewManager=THWebView()
    
    static  func shareManager(frame:CGRect) -> THWebView {
         webViewManager.frame=frame
        return  webViewManager
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        custwebView=WKWebView.init(frame: CGRect.zero, configuration: custconfig)
        
        configWebView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(custwebView)
        custwebView.frame=self.bounds
    }
    
    
    func configWebView()  {
        
    }
    
    
    lazy var custconfig: WKWebViewConfiguration = {
        let config=WKWebViewConfiguration.init()
        let preference=WKPreferences.init()
        //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
        preference.minimumFontSize=0
        //设置是否支持javaScript 默认是支持的
        preference.javaScriptEnabled=true
         // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
        preference.javaScriptCanOpenWindowsAutomatically=true
        config.preferences=preference
         // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
        config.allowsInlineMediaPlayback=true
        //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
        config.mediaTypesRequiringUserActionForPlayback = .all
        //设置请求的User-Agent信息中应用程序名称 iOS9后可用
        config.applicationNameForUserAgent = "ChinaDailyForiPad"
        config.userContentController=wkUController
        
        return config
    }()
    
    /// 这个类主要用来做native与JavaScript的交互管理
    lazy var wkUController: WKUserContentController = {
        let  wkUController=WKUserContentController()
        return wkUController
    }()
    
    
}



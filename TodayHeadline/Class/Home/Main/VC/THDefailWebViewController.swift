//
//  THDefailWebViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/15.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import WebKit
class THDefailWebViewController: UIViewController {
      var webUrl="https://www.baidu.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        let webv=THWebView.shareManager(frame: CGRect.zero)
        //let ddd=THWebView.shareManager()
       // let sssss=THWebView.shareManager()
       // let eeeee=THWebView.shareManager()
       configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden=true
        
        self.view.addSubview(cutemNative)
        //configUI()
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    func configUI()  {
        self.view.backgroundColor=UIColor.white
        self.view.addSubview(bottom)
       // self.view.addSubview(webView)
        webView.custwebView.uiDelegate=self
        webView.custwebView.navigationDelegate=self
        print("cndkcnlkdsnclknlknlknclkasnclk\(webUrl)")
        let requst=NSMutableURLRequest.init(url: URL.init(string: webUrl)!)
        //requst.addValue(<#T##value: String##String#>, forHTTPHeaderField: <#T##String#>)
        webView.custwebView.load(requst as URLRequest)
    }
    
    
   @objc func leftAction()  {
        self.navigationController?.popViewController(animated: true)
    }
    
  @objc  func rightAction()  {
        
    }
    
    lazy var bottom: THVideoDefailBottomView = {
        let bottom=THVideoDefailBottomView.init(frame: CGRect.init(x: 0, y: screenHeight-50, width: screenWidth, height: 50))
       // bottom.backgroundColor=UIColor.red
        return bottom
    }()
    lazy var cutemNative: THCustemNativeView = {
        let  cutemNative=THCustemNativeView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: NavHeight))
        cutemNative.leftButton.addTarget(self, action: #selector(leftAction), for: UIControl.Event.touchUpInside)
        cutemNative.rightButton.addTarget(self, action: #selector(rightAction), for: UIControl.Event.touchUpInside)
        return cutemNative
    }()
    lazy var webView:THWebView = {
        let webview=THWebView.shareManager(frame: CGRect.init(x: 0, y: NavHeight, width: screenWidth, height: screenHeight-NavHeight-50))
        return webview
    }()
   
    
    
  

}

extension THDefailWebViewController:WKUIDelegate,WKNavigationDelegate{
   
    /// 页面开始加载
    ///
    /// - Parameters:
    ///   - webView: <#webView description#>
    ///   - navigation: <#navigation description#>
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        MBProgressHUD.showCustomStatusAnimation(view: self.view)
    }
    
    
    /// 加载失败
    ///
    /// - Parameters:
    ///   - webView: <#webView description#>
    ///   - navigation: <#navigation description#>
    ///   - error: <#error description#>
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        MBProgressHUD.hide()
    }
    
    /// 当内容开始返回时调用
    ///
    /// - Parameters:
    ///   - webView: <#webView description#>
    ///   - navigation: <#navigation description#>
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        MBProgressHUD.hide()
        self.view.addSubview(self.webView)
    }
    
    /// 加载完成
    ///
    /// - Parameters:
    ///   - webView: <#webView description#>
    ///   - navigation: <#navigation description#>
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       /// MBProgressHUD.hide()
        //self.view.addSubview(webView)
    }
    // 接收到服务器跳转请求即服务重定向时之后调用
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
      // 根据WebView对于即将跳转的HTTP请求头信息和相关信息来决定是否跳转 拦截消息头
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//
//    }
    // 根据客户端受到的服务器响应头以及response相关信息来决定是否可以跳转
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//
//    }
    //需要响应身份验证时调用 同样在block中需要传入用户身份凭证
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        
//    }
    //进程被终止时调用
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
    }
    
    
    

    
    //MARK  WKNavigationDelegate
    /**
     *  web界面中有弹出警告框时调用
     *
     *  @param webView           实现该代理的webview
     *  @param message           警告框中的内容
     *  @param completionHandler 警告框消失调用
     */
   
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
    
    /// JavaScript调用confirm方法后回调的方法 confirm是js中的确定框，需要在block中把用户选择的情况传递进去
    ///
    /// - Parameters:
    ///   - webView: <#webView description#>
    ///   - message: <#message description#>
    ///   - frame: <#frame description#>
    ///   - completionHandler: <#completionHandler description#>
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
    }
    // 输入框
    //JavaScript调用prompt方法后回调的方法 prompt是js中的输入框 需要在block中把用户输入的信息传入
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
    }
    //// 页面是弹出窗口 _blank 处理
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return nil
    }
    
    
}

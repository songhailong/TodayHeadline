//
//  THShortVideoResourceLoader.swift
//  TodayHeadline
//
/***
 
 对于AVPlayer连接播放器层与缓存层的数据交互是通过自定义实现AVAssetResourceLoaderDelegate协议实现的
 
 
 **/

import UIKit
import AVFoundation

enum ShortVideoOptions:String{
   case HandleCookies="HandleCookies"
   case AllowInvalidSSLCertificates="AllowInvalidSSLCertificates"
}

protocol  ShortVideoResourceLoaderDelegate:class{
    
}

class THShortVideoResourceLoader: NSObject {
    
    var  url:URL? = nil
   weak var delegate:ShortVideoResourceLoaderDelegate?
    var pendingRequests=[Any]()
    var options=ShortVideoOptions.HandleCookies
     /// 需要下载的大小
    var expectedSize=0
    /// 收到缓存大小
    var receivedSize=0
    
    func palyerItemWithUrl(url:URL,opration:ShortVideoOptions) -> AVPlayerItem {
        
        let asset = AVURLAsset.init(url: URL.init(string: "")!)
        asset.resourceLoader.setDelegate(self as! AVAssetResourceLoaderDelegate, queue:DispatchQueue.main)
      let item=AVPlayerItem.init(asset: asset)
        return item
        
    }
    
    
    
}
extension  THShortVideoResourceLoader:AVAssetResourceLoaderDelegate{
    ///对loadingRequest进行处理，数据回填
    func resourceLoader(_ resourceLoader: AVAssetResourceLoader, shouldWaitForResponseTo authenticationChallenge: URLAuthenticationChallenge) -> Bool {
        return true
    }
    ///取消请求处理
    func resourceLoader(_ resourceLoader: AVAssetResourceLoader, didCancel loadingRequest: AVAssetResourceLoadingRequest) {
        
    }
    
   
    
}

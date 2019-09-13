//
//  THShortDownLoader.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/9/13.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

typealias ShortMediaProgressBlock = (Int,Int) -> Void
typealias ShortMediaCompletionBlock = (NSError) -> Void
class THShortDownLoader: NSObject {
    var userName = ""
    var passWord=""
    var canPreload=true
   private  var session=URLSession()
   private var queue=OperationQueue()
   private var operationCache=[String:Any]()
   private var lock=DispatchSemaphore.init(value: 1)
    //“懒实例化”的全局变量会被自动放在dispatch_once块中
    //需要提前加载avplayer
    static let sharedDownloader: THShortDownLoader = {
        let instance = THShortDownLoader()
        return instance
    }()
    override init() {
        super.init()
        let sessionconfig=URLSessionConfiguration.default
        session=URLSession.init(configuration: sessionconfig, delegate: self, delegateQueue: nil)
    }
    
    
    /// 下载视频数据
    ///
    /// - Parameters:
    ///   - url: 下载地址
    ///   - options: 下载方式
    ///   - progress: 进度
    ///   - completion: 完成
    func downloadMediaWithUrl(url:URL,options:ShortVideoOptions,progress:ShortMediaProgressBlock,completion:ShortMediaCompletionBlock)  {
        self.downloadMediaWithUrl(url: url, options: options, preload: false, progress: progress, completion: completion)
    }

    
    /// 预加载
    ///
    /// - Parameters:
    ///   - url: 下载地址
    ///   - options: 下载方式
    ///   - progress: 进度
    ///   - completion: 完成
    func preloadMediaWithUrl(url:URL,options:ShortVideoOptions,progress:ShortMediaProgressBlock,completion:ShortMediaCompletionBlock)  {
        self.downloadMediaWithUrl(url: url, options: options, preload: true, progress: progress, completion: completion)
    }
    
    
    private  func downloadMediaWithUrl(url:URL,options:ShortVideoOptions,preload:Bool, progress:ShortMediaProgressBlock,completion:ShortMediaCompletionBlock)  {
        
        
        
    }
    
    
    
    func downloadMediaWithUrl(url:URL){
        
    }
    
    
    
}

// MARK: - 下载任务代理  URLSessionTaskDelegate
extension THShortDownLoader:URLSessionTaskDelegate{
    
}

//
//  THShortVideoCache.swift
//  TodayHeadline
//
//短视频缓存

import UIKit

class THShortVideoCache: NSObject {
    
    var urlFileNameCache=[String:Any]()
    var fileQueue=DispatchQueue.init(label: "com.DandJ.shortMedia.cache")
    var lock=DispatchSemaphore.init(value: 1)
    
    //“懒实例化”的全局变量会被自动放在dispatch_once块中
    static let sharedVideoCache: THShortVideoCache = {
        let instance = THShortVideoCache()
        var  cachePath=NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, .systemDomainMask, true)[0]
        cachePath=cachePath + "com.DandJ.shortMedia"
        
        return instance
    }()
   
    
    ///是否已经缓存过了
    func isCacheCompletedWithUrl(url:URL) -> Bool {
       return true
    }
    
    
    
    
}
extension THShortVideoCache{
//    func fileNmaeWithUrl(url:URL) -> String {
//
//    }
    
}

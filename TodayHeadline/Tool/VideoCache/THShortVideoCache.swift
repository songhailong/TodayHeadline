//
//  THShortVideoCache.swift
//  TodayHeadline
//
//短视频缓存

import UIKit
import CommonCrypto
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
        
        let fileName=fileNmaeWithUrl(url: url)
        lock.wait()
        //let ret = 
        lock.signal()
        
       return true
    }
    
    
    
    
}
extension THShortVideoCache{
   func fileNmaeWithUrl(url:URL) -> String {
    let urlstr=url.absoluteString
    var filename:String=urlFileNameCache[urlstr] as! String
    if (filename != nil) {
        filename="\(urlstr.md5))"
        urlFileNameCache[urlstr]=filename
    }
    
    return filename as! String
    }
    
    func Lock()  {
        lock.wait()
    }
    
    
}

extension String{
    var md5:String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        
        return digest.reduce("") { $0 + String(format:"%02X", $1) }
    }
    
   
}

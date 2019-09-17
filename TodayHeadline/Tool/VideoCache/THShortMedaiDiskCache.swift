//
//  THShortMedaiDiskCache.swift
//  TodayHeadline
//
//任务缓存
import UIKit
import Foundation
class THShortMedaiDiskCache: NSObject {
    var finalPath:String=String.init()
    var tempPath:String=String.init()
    var trashPath:String=String.init()
    var fileHandleCache:CFMutableDictionary?
    
    init(path:String) {
      super.init()
        finalPath=path.appending("media")
        tempPath=path.appending("temp")
        trashPath=path.appending("trash")
        let fileManager=FileManager.default
        //fileHandleCache=CFDictionaryCreateMutable(CFAllocatorGetDefault() as? CFAllocator, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)
//        if fileManager.createDirectory(atPath: <#T##String#>, withIntermediateDirectories: <#T##Bool#>, attributes: <#T##[FileAttributeKey : Any]?#>))
        
        
        
        
    }
    
    
    func tempCachedSizehWithName(url:URL) -> Bool {
        
    }
    
    
    
    
    
}

//
//  THShortMedaiDiskCache.swift
//  TodayHeadline
//
//任务缓存
import UIKit
import Foundation
class THShortMedaiDiskCache: NSObject {
    var finalPath:String?
    var tempPath:String?
    var trashPath:String?
    
    
    init(path:String) {
      super.init()
        finalPath=path.appending("media")
        tempPath=path.appending("temp")
        trashPath=path.appending("trash")
        let fileManager=FileManager.default
      
        
    }
    
}

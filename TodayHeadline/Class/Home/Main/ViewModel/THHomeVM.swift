//
//  THHomeVM.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/7/1.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class THHomeVM: NSObject {
  class  func loadNewsFeeds(category:NewsTitleCategory,ttFrome:TTFrom,completionHander:@escaping (_ maxBehotTime: TimeInterval,_ news:[THTexstsModel])->()) {
        let pullTime = Date().timeIntervalSince1970
        let url = BASE_URL + "/api/news/feed/v75/?"
        let params = ["device_id": device_id,
                      "count": 20,
                      "list_count": 15,
                      "category": category.rawValue,
                      "min_behot_time": pullTime,
                      "strict": 0,
                      "detail": 1,
                      "refresh_reason": 1,
                      "tt_from": ttFrome,
                      "iid": iid] as [String: Any]
        THHttpTool.getLoadDate(url: url, parameters: params) { (respond) in
            
           
            
            let date = JSON(respond)
            
            
            
            
            print("刷新\(date)")
            guard date["message"] == "success" else { return }
            guard let dates=date["data"].array else { return}
            var news=[THTexstsModel]()
            for(index, item)in dates.enumerated(){
                let dic=item["content"].string
              // news.append(THTexstsModel.mj_object(withKeyValues: item))
                if let model=THTexstsModel.deserialize(from: dic){
                    news.append(model)
                }
                
            }
            
            completionHander(pullTime,news)
        }
    }
        /***
         maxReshTime:刷新时间 最早时间
         fromCount:从多少个加载
         **/
    
    static   func loadMoreNewsFeed (categray:NewsTitleCategory,ttfrom:TTFrom,maxReshTime:TimeInterval,fromCount:Int,completionHander:@escaping ([THTexstsModel]) ->()){
             let url = BASE_URL + "/api/news/feed/v75/?"
            let params=["device_id": device_id,
                        "count": 20,
                        "list_count": fromCount,
                        "category": categray.rawValue,
                        "max_behot_time": maxReshTime,
                        "strict": 0,
                        "detail": 1,
                        "refresh_reason": 1,
                        "tt_from": ttfrom,
                        "iid": iid] as [String: Any]
        THHttpTool.PostLoadDate(url: url, parameters: params) { (respond) in
            let json=JSON(respond)
            print(json)
            guard json["message"] == "success" else {return}
            guard let dates=json["data"].array else {return}
            var news=[THTexstsModel]()
            for(index, item)in dates.enumerated(){
                let dic=item["content"].string
                // news.append(THTexstsModel.mj_object(withKeyValues: item))
                if let model=THTexstsModel.deserialize(from: dic){
                    news.append(model)
                }
                
            }

            completionHander(news)

        }
    }
    
    
    
   class func parseVideoRealURL(video_id: String, completionHandler: @escaping (_ realVideo: RealVideo) -> ()) {
        let r = arc4random() // 随机数
        
        let url: NSString = "/video/urls/v/1/toutiao/mp4/\(video_id)?r=\(r)" as NSString
        let data: NSData = url.data(using: String.Encoding.utf8.rawValue)! as NSData
        // 使用 crc32 校验
        var crc32: UInt64 = UInt64(data.getCRC32())
        // crc32 可能为负数，要保证其为正数
        if crc32 < 0 { crc32 += 0x100000000 }
        // 拼接 url
        let realURL = "http://i.snssdk.com/video/urls/v/1/toutiao/mp4/\(video_id)?r=\(r)&s=\(crc32)"
        
        THHttpTool.getLoadDate(url: realURL) { (respond) in
            let json = JSON(respond)
            
            guard json["message"] == "success" else {return}
           guard let dates=json["data"].dictionaryObject else {return}
            print(dates)
            
            if let redomodel=RealVideo.deserialize(from: dates){
            
                print("nhoihio\(redomodel.video_list.video_1)")
                
                completionHandler(redomodel)
                
            }
        }
        
    }
    
        
}

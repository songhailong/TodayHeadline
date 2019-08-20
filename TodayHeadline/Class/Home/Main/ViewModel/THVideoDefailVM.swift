//
//  THVideoDefailVM.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/16.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import SwiftyJSON
class THVideoDefailVM: NSObject {
    
    /// 关注用户用户
    ///
    /// - Parameters:
    ///   - userId: <#userId description#>
    ///   - completionHandler: <#completionHandler description#>
    static func loadRelationFollow(userId: Int, completionHandler: @escaping (_ user: ConcernUser) -> ()) {
        
        let url = BASE_URL + "/2/relation/follow/v2/?"
        let params = ["user_id": userId,
                      "device_id": device_id,
                      "iid": iid]
        THHttpTool.getLoadDate(url: url, parameters: params) { (respond) in
            let data=JSON(respond)
            guard data["message"] == "success" else { return }
            guard let dates = data["data"].dictionaryObject else {return}
            completionHandler(ConcernUser.deserialize(from: dates["user"] as? Dictionary)!)
        }
     
       }
    
    
    static func loadRelationUnfollow(userId: Int, completionHandler: @escaping (_ user: ConcernUser) -> ()) {
        
        let url = BASE_URL + "/2/relation/unfollow/?"
        let params = ["user_id": userId,
                      "device_id": device_id,
                      "iid": iid]
        
        
        THHttpTool.getLoadDate(url: url, parameters: params) { (respond) in
            let data=JSON(respond)
            guard data["message"] == "success" else { return }
            guard let dates = data["data"].dictionaryObject else {return}
            completionHandler(ConcernUser.deserialize(from: dates["user"] as? Dictionary)!)
        }
    }
    
 /// 获取详情数据
 ///
 /// - Parameters:
 ///   - from: <#from description#>
 ///   - itemId: <#itemId description#>
 ///   - groupId: <#groupId description#>
 ///   - completionHandler: <#completionHandler description#>
 static   func loadArticleInformation(from:String,itemId: Int, groupId: Int, completionHandler:@escaping (_ videoDetail: VideoDetail) -> ())  {
        let url = BASE_URL + "/2/article/information/v23/?"
        let params = ["device_id": device_id,
                      "iid": iid,
                      "app_name": "news_article",
                      "version_code": "6.5.5",
                      "device_platform": "iphone",
                      "flags": 64,
                      "aid": 13,
                      "aggr_type": 1,
                      "article_page": 1,
                      "from": from,
                      "item_id": itemId,
                      "group_id": groupId] as [String : Any]
    print("是地方是饭店宝宝VCD\(url)\(params)")
        THHttpTool.getLoadDate(url: url, parameters: params) { (respond) in
            let data=JSON(respond)
            print("上清数据\(data)")
           
            guard data["message"] == "success" else { return
                 MBProgressHUD.showInfo(data["message"] as? String)
            }
            guard let dates = data["data"].dictionaryObject else {return}
            completionHandler(VideoDetail.deserialize(from:dates)!)
        }
        
        
    }
    
   
    /// 获取评论数据
    ///
    /// - Returns: <#return value description#>
  static  func loadUserDetailNormalDongtaiComents(groupId: Int, offset: Int, count: Int, completionHandler: @escaping (_ comments: [DongtaiComment]) -> ())  {
        let url = BASE_URL + "/article/v2/tab_comments/"
        let params = ["forum_id": "",
                      "group_id": groupId,
                      "count": count,
                      "offset": offset,
                      "device_id": device_id,
                      "iid": iid] as [String : Any]
        THHttpTool.getLoadDate(url: url, parameters: params) { (respond) in
            let data=JSON(respond)
             print("评论\(data)")
            guard data["message"] == "success" else {
         MBProgressHUD.showInfo(data["message"] as? String)
                return }
             guard let dates = data["data"].array else {return}
            
            var news=[DongtaiComment]()
            for(index, item)in dates.enumerated(){
                let dic=item["comment"].string
                // news.append(THTexstsModel.mj_object(withKeyValues: item))
                if let model=DongtaiComment.deserialize(from: dic){
                    news.append(model)
                }
                
            }
            
            completionHandler(news)
            
        }
    }
    
    
    /// 视频详情数据
    /// - parameter from: 来源（click_video）
    /// - parameter itemId: item_id
    /// - parameter groupId: group_id
    /// - parameter completionHandler: 返回视频详情数据
    /// - parameter videoDetail: 视频详情数据
    static func parseVideoRealURL(video_id: String, completionHandler: @escaping (_ realVideo: RealVideo) -> ()) {
        let r = arc4random() // 随机数
        
        let url: NSString = "/video/urls/v/1/toutiao/mp4/\(video_id)?r=\(r)" as NSString
        let data: NSData = url.data(using: String.Encoding.utf8.rawValue)! as NSData
        // 使用 crc32 校验
        var crc32: UInt64 = UInt64(data.getCRC32())
        // crc32 可能为负数，要保证其为正数
        if crc32 < 0 { crc32 += 0x100000000 }
        // 拼接 url
        let realURL = "http://i.snssdk.com/video/urls/v/1/toutiao/mp4/\(video_id)?r=\(r)&s=\(crc32)"
        
        THHttpTool.getLoadDate(url:url as String) { (respond) in
            let data=JSON(respond)
            guard data["message"] == "success" else { 
                MBProgressHUD.showInfo(data["message"] as? String)
                return
            }
            guard let dates = data["data"].dictionaryObject else {return}
            completionHandler(RealVideo.deserialize(from:dates)!)
            
        }
    }
    
    
}

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
        THHttpTool.getLoadDate(url: url, parameters: params) { (respond) in
            let data=JSON(respond)
            guard data["message"] == "success" else { return }
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
            guard data["message"] == "success" else { return }
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
    
    
    
    
}

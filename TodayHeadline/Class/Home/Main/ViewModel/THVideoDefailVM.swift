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
    
    
    
   
    
    
    
}

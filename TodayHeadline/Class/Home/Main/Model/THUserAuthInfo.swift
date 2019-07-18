//
//  THUserAuthInfo.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/7/2.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

//@objcMembers
class THUserAuthInfo: HandyJSON {
    required init(){}
    var auth_type: Int = 0
    var auth_info: String = ""
}
// MARK: 相关推荐模型
struct UserCard: HandyJSON {
    
    var name: String = ""
    
    var recommend_reason: String = ""
    
    var recommend_type: Int = 0
    
    var user: UserCardUser = UserCardUser()
    
    var stats_place_holder: String = ""
    
}

// MARK: 相关推荐的用户模型
struct UserCardUser: HandyJSON {
    
    var info: UserCardUserInfo = UserCardUserInfo()
    
    var relation: UserCardUserRelation = UserCardUserRelation()
    
}

// MARK: 相关推荐的用户信息模型
struct UserCardUserInfo: HandyJSON {
    
    var name: String = ""
    
    var user_id: Int = 0
    
    var avatar_url: String = ""
    
    var desc: String = ""
    
    var schema: String = ""
    
    var user_auth_info = THUserAuthInfo()
}

// MARK: 相关推荐的用户是否关注模型
struct UserCardUserRelation: HandyJSON {
    
    var is_followed: Bool = false
    
    var is_following: Bool = false
    
    var is_friend: Bool = false
    
}
// MARK: 位置
struct DongtaiPosition: HandyJSON {
    
    var position: String = ""
}

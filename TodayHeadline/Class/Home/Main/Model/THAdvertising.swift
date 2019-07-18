//
//  THAdvertising.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/7/2.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
/***广告模型****/


class THAdvertising: HandyJSON {
    required init() {}
     var download_url: String = ""
    var id: Int = 0
    var web_url: String = ""
    var app_name: String = ""
    var track_url: String = ""
    var ui_type: Int = 0
    var click_track_url: String = ""
    var button_text: String = ""
    var display_type: Int = 0
    var hide_if_exists: Int = 0
    var open_url: String = ""
    var source: String = ""
    var type: String = ""
    var package: String = ""
    var appleid: String = ""
    var web_title: String = ""
    
}
/****发布中心***/
//@objcMembers
class MediaInfo: HandyJSON {
    required init() {}
    var follow: Bool = false
    var is_star_user: Bool = false
    var recommend_reason: String = ""
    var user_verified: Bool = false
    var media_id: Int = 0
    var verified_content: String = ""
    var user_id: Int = 0
    var recommend_type: Int = 0
    var avatar_url: String = ""
    var name: String = ""
}
/***新闻用户信息**/
//@objcMembers
class NewsUseriInfo:HandyJSON{
    required init() {}
    var follow: Bool = false
    var name: String = ""
    var user_verified: Bool = false
    var verified_content: String = ""
    var user_id: Int = 0
    var id: Int = 0
    var desc: String = ""
    var avatar_url: String = ""
    var follower_count: Int = 0
    var followerCount: String { return follower_count.convertString() }
    var user_decoration: String!
    var subcribed: Int = 0
    var fans_count: Int = 0
    var fansCount: String { return fans_count.convertString() }
    var special_column = [SpecialColumn]()
    var user_auth_info: String!
    var media_id: Int = 0
    var screen_name = ""
    var is_followed: Bool = false
    var is_following: Bool = false // 是否正在关注
    var is_blocking: Bool = false
    var is_blocked: Bool = false
    var is_friend: Bool = false
    var medals = [String]() // hot_post (热门内容)
}

class SpecialColumn: HandyJSON {
    required init() {}
}

class ForwardInfo:HandyJSON {
    required init() {}
    var forward_count: Int = 0
    var forwardCount: String { return forward_count.convertString() }
}
/***分享模型***/
//@objcMembers
class ShareModel: HandyJSON{
    required init() {}
    var share_title: String = ""
    var share_url: String = ""
    var share_weibo_desc: String = ""
    var share_cover: String = ""
    var share_desc: String = ""
}
/**音频模型***/
//@objcMembers
class MusicModel: HandyJSON {
    required init() {}
    var author: String = ""
    var music_id: Int = 0
    var title: String = ""
    var cover_large: String = ""
    var album: String = ""
    var cover_medium: String = ""
    var cover_thumb: String = ""
    var cover_hd: String = ""
}
//@objcMembers
class  VideoUser:HandyJSON{
    required init() {}
    var relation_count = RelationCount()
    var relation = Relation()
    var info = VideoUserInfo()
}
//@objcMembers
class Relation: HandyJSON {
    required  init() {}
    var is_followed = false
    var is_friend = false
    var is_following = false
    var remark_name: String = ""
}
//@objcMembers
class VideoUserInfo: HandyJSON {
    required init() {}
    var medals: String = ""
    var avatar_url: String = ""
    var schema: String = ""
    var user_auth_info = THUserAuthInfo()
    var user_id: Int = 0
    var desc: String = ""
    var ban_status: Bool = false
    var user_verified = false
    var verified_content: String = ""
    var media_id: String = ""
    var name: String = ""
    var user_decoration: String = ""
}
//@objcMembers
 class RelationCount: HandyJSON {
    required init() {}
    var followings_count: Int = 0
    var followingsCount: String { return followings_count.convertString() }
    var followers_count: Int = 0
    var followersCount: String { return followers_count.convertString() }
}
//@objcMembers
class PlayAddr: HandyJSON {
    required init() {}
    var uri: String = ""
    var url_list = [String]()
}
//@objcMembers
class OriginCover: HandyJSON {
    required init() {}
}
//@objcMembers
class URLList: HandyJSON {
    required init() {}
    var url: String = ""
}
//@objcMembers
class DongtaiAuthorBadge: HandyJSON {
    required init() {}
    var open_url: String = ""
    var uri: String = ""
    var url_list = [URLList]()
    var url: String = ""
    var width: Int = 0
    var height: Int = 0
}
//@objcMembers
class UGCCutImage: HandyJSON {
    required init() {}
    var type = ImageType.normal
    var height: CGFloat = 0
    
    var url_list = [URLList]()
    
    var url: String = ""
    
    var width: CGFloat = 0
    
    var uri: String = ""
}
//@objcMembers
class OriginGroupMiddleImage: HandyJSON {
    required init() {}
    var uri: String = ""
    var url: String = ""
    var width = 0
    var height = 0
    
    var url_list = [URLList]()
    
    var type = 0
}
/***分辨率***/
//@objcMembers
class UserDetailArticleVideoSizeResolve: HandyJSON {
    required init() {}
    var h = 0
    var w = 0
    var file_size = ""
    var subjective_score = ""
}
//@objcMembers
class UserDetailArticleOptionalData: HandyJSON {
    required init() {}
    var star: String = ""
    
    var label3: String = ""
    
    var praise: String = ""
    
    var video_search_items: String = ""
    
    var elite: String = ""
    
    var pgc_source: String = ""
    
    var originality: String = ""
    
    var has_extern_link: String = ""
}
//@objcMembers
class UserDetailArticleVerifyDetailEditor: HandyJSON {
    required init() {}
    var status = 0
}
//@objcMembers
class UserDetailArticleSlaveInfo: HandyJSON {
    required init() {}
    var id = 0
    
    var slave_source = 1
}
//@objcMembers
class UserDetailArticleVerifyDetail: HandyJSON {
    required init() {}
    var auto = UserDetailArticleVerifyDetailAuto()
    
    var editor = UserDetailArticleVerifyDetailEditor()
    
    var pass_time: String = ""
}
//@objcMembers
class UserDetailArticleVerifyDetailAuto: HandyJSON {
    required init() {}
    var status = 0
}
//@objcMembers
class UserDetailArticleVideoInfo: HandyJSON {
    required init() {}
    var thumb_width: Int = 0
    
    var thumb_height: Int = 0
    
    var sp: String = ""
    
    var vid: String = ""
    
    var video_size = UserDetailArticleVideoSize()
    
    var duration: Int = 0
    
    var thumb_url: String = ""
    
    var vu: String = ""
    
    var video_partner: Int = 0
}
//@objcMembers
class UserDetailArticleVideoSize: HandyJSON {
    required init() {}
    var high = UserDetailArticleVideoSizeResolve()
    var ultra = UserDetailArticleVideoSizeResolve()
    var normal = UserDetailArticleVideoSizeResolve()
}
//@objcMembers
class UserDetailArticleImageList: HandyJSON {
    required init() {}
    var url = ""
    
    var pc_url = ""
}
//@objcMembers
class PicUriList: HandyJSON {
    required init() {}
    var web_uri: String = ""
    var width: Int = 0
    var type: String = ""
    var height: Int = 0
}
//@objcMembers
class UserDetailArticleCoverImageInfos: HandyJSON {
    required init() {}
    var mimetype = ""
    
    var image_type = 0
    
    var height = 0
    
    var width = 0
    
    var web_uri = ""
    
    var desc = ""
}
//@objcMembers
class RepostParam: HandyJSON {
    required init() {}
    var opt_id: Int = 0
    
    var repost_type: Int = 0
    
    var schema: String = ""
    
    var fw_id_str: String = ""
    
    var opt_id_str: String = ""
    
    var opt_id_type: Int = 0
    
    var fw_id_type: Int = 0
    
    var fw_user_id: Int = 0
    
    var fw_id: Int = 0
    
    var cover_url = ""
    
    var title = ""
}

class DongtaiUser: HandyJSON {
    required init() {}
    var schema: String = ""
    
    var user_verified: Bool = false
    
    var is_friend: Int = 0
    
    var is_blocking: Int = 0
    
    var is_blocked: Int = 0
    
    var user_id: Int = 0
    
     var screen_name: String = ""
    
    var avatar_url: String = ""
    
    var verified_reason: String = ""
    
    var id: Int = 0
    var medals = [Any]()
    
    var followers_count: Int = 0
    var followersCount: String { return followers_count.convertString() }
    var followings_count: Int = 0
    var followingsCount: String { return followings_count.convertString() }
    var name: String = ""
    var desc: String = ""
    var is_following: Int = 0
    var verified_content: String = ""
    var user_role_icons = [Any]()
    var remark_name: String = ""
    var user_intro: String = ""
    var profit_user: Bool = false
    var is_verify: Int = 0
    var profit_amount: Int = 0
    var uname: String = ""
    var create_time: Int = 0
    var user_auth_info = THUserAuthInfo()
}











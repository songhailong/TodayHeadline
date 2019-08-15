//
//  THSmallVideo.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/3.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

//MARK 小视频模型
class THSmallVideo: HandyJSON {
    required init(){}
   // let emojiManager = EmojiManager()
    
    var rich_title: String = ""
    var group_id: Int = 0
    //var status = Status()
    //var thumb_image_list = [ThumbImage]()
    var title: String = ""
//    var attrbutedText: NSMutableAttributedString {
//        //return emojiManager.showEmoji(content: title, font: UIFont.systemFont(ofSize: 17))
//    }
    
    var create_time: TimeInterval = 0
    //var createTime: String { return create_time.convertString() }
    
    var recommand_reason: String = ""
    var first_frame_image_list = [FirstFrameImage]()
    var action = SmallVideoAction()
    //var app_download = AppDownload()
    var app_schema: String = ""
    var interact_label: String = ""
    var activity: String = ""
    var large_image_list = [LargeImage]()
    var group_source: GroupSource = .huoshan
    //var share = Share()
   // var publish_reason = PublishReason()
    var music = MusicModel()
    var title_rich_span: String = ""
    var user = User()
    var video = Video()
    var label: String = ""
    var label_for_list: String = ""
    var distance: String = ""
    var detail_schema: String = ""
    var item_id: Int = 0
   // var animated_image_list = [AnimatedImage]()
    var video_neardup_id: Int = 0
    
    /// 他们也在用
    var user_cards = [UserCard]()
    var has_more = false
    var id = 0
    var show_more = ""
    var show_more_jump_url = ""
}
class FirstFrameImage: HandyJSON {
     required init(){}
    var uri: String = ""
    var image_type: Int = 0
    var url_list = [URLList]()
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    var width: Int = 0
    var height: Int = 0
}

struct SmallVideoAction: HandyJSON {
    var bury_count = 0
    var buryCount: String { return bury_count.convertString() }
    var comment_count = 0
    var commentCount: String { return comment_count.convertString() }
    var digg_count = 0
    var diggCount: String { return digg_count.convertString() }
    var forward_count = 0
    var forwardCount: String { return forward_count.convertString() }
    var play_count = 0
    var playCount: String { return play_count.convertString() }
    var read_count = 0
    var readCount: String { return read_count.convertString() }
    var user_bury = 0
    var userBury: String { return user_bury.convertString() }
    var user_repin = 0
    var userRepin: String { return user_repin.convertString() }
    var user_digg = false
}

//struct Action: HandyJSON {
//    var extra = Extra()
//    var action: Int = 0
//    var desc: String = ""
//}
struct Video: HandyJSON {
    var logo_name: String = ""
    var coded_format: String = ""
    var vwidth: Int = 0
    var socket_buffer: Int = 0
    var preload_interval: Int = 0
    var preload_size: Int = 0
    var preload_min_step: Int = 0
    var bitrate: Int = 0
    var size: Int = 0
    /// 用 base 64 加密的视频真实地址
    var main_url: String = ""
    var mainURL: String {
        let decodeData = Data(base64Encoded: main_url, options: Data.Base64DecodingOptions(rawValue: 0))
        return String(data: decodeData!, encoding: .utf8)!
    }
    
    var user_video_proxy: Int = 0
    var backup_url_1: String = ""
    var preload_max_step: Int = 0
    var definition: String = ""
    var vheight: Int = 0
    var vtype: String = ""
    var height: Int = 0
    var download_addr = DownloadAddr()
    var play_addr = PlayAddr()
    var origin_cover = OriginCover()
    var width: Int = 0
    var duration: CGFloat = 0.0
    var video_id: String = ""
    var ratio: String = ""
}
struct DownloadAddr: HandyJSON {
    var uri: String = ""
    var url_list = [String]()
}
struct User: HandyJSON {
    var relation_count = RelationCount()
    var relation = Relation()
    var info = Info()
}

struct Info: HandyJSON {
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

struct RealVideo: HandyJSON {
    var status: Int = 0
    var user_id: String = ""
    var video_id: String = ""
    var validate: Int = 0
    var enable_ssl: Bool = false
    var video_duration: Float = 0.0
    var video_list = VideoList()
}
struct VideoList: HandyJSON {
    var video_1 = Video()
    var video_2 = Video()
    var video_3 = Video()
}
struct DongtaiComment: HandyJSON {
    
    var id: Int = 0
    var medals = [Any]()
    var is_blocking = false
    var followers_count: Int = 0
    var followings_count: Int = 0
    var remark_name: String = ""
    var avatar_url: String = ""
    var schema: String = ""
    var user_auth_info = THUserAuthInfo()
    var user_id: Int = 0
    var desc: String = ""
    var is_following = false
    var is_friend = false
    var is_blocked = false
    var user_verified: Bool = false
    var verified_content: String = ""
    var user_role_icons = [Any]()
    var name: String = ""
    var screen_name: String = ""
    var is_followed = false
    var user_bury: Int = 0
    var create_time: TimeInterval = 0
    var createTime: String { return create_time.convertString() }
    
    var reply_count: Int = 0
    var digg_count: Int = 0
    var diggCount: String { return digg_count.convertString() }
    var score: Float = 0.0
    var bury_count: Int = 0
    var buryCount: String { return bury_count.convertString()}
    var reply_list = [DongtaiReplyList]()
    var verified_reason: String = ""
    var is_pgc_author = false
    var content_rich_span: String = ""
    var user_relation: Int = 0
    var platform: String = ""
    var user_digg = false
    var user_profile_image_url: String = ""
    var text: String = ""
    var attributedContent: NSAttributedString {
        let emojimanager = EmojiManager()
        return emojimanager.showEmoji(content: text, font: UIFont.systemFont(ofSize: 17))
    }
    
    var content = ""
    var user_name: String = ""
    var author_badge = [DongtaiAuthorBadge]()
    var user = DongtaiUser()
    
}
struct DongtaiReplyList: HandyJSON {
    var id: Int = 0
    var is_pgc_author: Int = 0
    var user_digg = false
    var user_auth_info = THUserAuthInfo()
    var user_id: Int = 0
    var author_badge = [DongtaiAuthorBadge]()
    var user_profile_image_url: String = ""
    var user_name: String = ""
    var user_verified: Bool = false
    var text: String = ""
    var digg_count: Int = 0
    var content_rich_span: String = ""
}


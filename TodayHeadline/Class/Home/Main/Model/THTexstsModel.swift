//
//  THTexstsModel.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/7/1.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import MJExtension

class THTexstsModel:HandyJSON{
    
    /***计算的缓存 如果只重写 get 方法,默认为 readOnly***/
    
    required init() {}
    /*****需要的计算内容******/
    //MARK  普通cell分为 用户 关注  基本
    var cellHeight:CGFloat{
        /**固定的 头部距离10 评论高16 评论距离5 底部还有5 */
        var height:CGFloat=titleH+36
        if video_duration != 0 && video_style == 2{
            //说明有视频显示
            height+=screenWidth*0.5
        }
        if label_style == .ad && sub_title != ""{
            // sub_title 广告语
            height+=40
        }
        
        if middle_image.url != "" && image_list.count==0{
            //有大图
            return 95
        }else{
            if image_list.count != 0 {
                if image_list.count == 1 {
                     height+=screenWidth*0.5
                    
                }
                else {
                    
                   height+=image3Width
                }
            }
            
        }
        
        
        
        return height
    }
    /**文字高度****/
    var titleH :CGFloat{
        if video_duration != 0 && video_style == 0 { // // 右侧有图
            return title.calculateHeight(fontSize: 17, width: screenWidth * 0.72 - 30)
        } else {
            return title.calculateHeight(fontSize: 17, width: screenWidth - 30)
        }
    }
    
    /**计算图片高度**/
    var imageCellHeight: CGFloat {
        // imageHeight + titleH! + 10 + 40
        let imageHeight = screenWidth * 9.0 / 16.0 + titleH
        return imageHeight + 50
    }
    
    var title=""
    var UserCellH:CGFloat?
    
    var relatedCellH:CGFloat?
    
   
    
    //新闻内容
   var abstract:String = ""
   var aggr_type: Int = 0
    var allow_download:Bool=false
   var article_sub_type:Int=0
   var article_type:Int=0
    //文章地址
    var article_url:String=""
    var article_version:String=""
    //发表时间
    var behot_time:TimeInterval=0
    
    var bury_count:Int=0
    var cell_flag:Int=0
    //cell布局风格
    var cell_layout_style:Int=0
    //cell 类型
    var cell_type=CellType.none
    //评论数量
    var comment_count:Int=0
    var commentCount:String{
       return comment_count.convertString()
    }
    //内容装饰
    var content_decoration:String=""
    var tip: Int = 0
    //帆布时间
   var publish_time: TimeInterval = 0
    
    var publishTime: String { return publish_time.convertString() }
    
    var label:String=""
     var hot: Bool = false  // 热
    var digg_count:Int=0
  //详情页
    var display_url:String=""
     var filter_words:[Any]?
    //显示的图片数量
   var gallary_image_count:Int=0
    /**是否显示图片**/
   var has_image:Bool=false
    /**是否播放视频**/
   var has_m3u8_video=false
    
    var  video_duration:Int=0
    
   var ignore_web_transform:Int=0
    /**显示的图片列表**/
    var image_list=[ImageList]()
    
    var interaction_data:String=""
    /**是否是主题**/
    var is_subject:Bool=false
    var item_id:Int=0
   var item_version:Int=0
    /**重要文献**/
    var keywords:String=""
    var level:Int=0
    /***发表中心*/
    var media_info=MediaInfo()
    /***图标**/
    var log_pb:LogPB?
    /**发表机构名称***/
    var media_name:String=""
    /**机构图片**/
    var middle_image=ImageList()
    
   var need_client_impr_recycle:Int=0
    //阅读数量
    var read_count:Int=0
    var repin_count:Int=0
    var rid:String=""
    /**分享个数**/
   var  share_count:Int=0
    /**分享数据**/
    var share_info=ShareInfo()
    var share_url:String=""
    var source:String=""
   var token_type:Int=0
  
    var raw_data=THSmallVideo()
   var show_dislike=false
    var show_portrait:Bool=false
    var show_portrait_article:Bool=false
    var source_icon_style:Int=0
    var source_open_url:String=""
    var tag:String=""
    var tag_id:Int=0
    /**推荐**/
    var ugc_recommend=Recommend()
    var url:String=""
    var user_info=NewsUseriInfo()
    var user = NewsUseriInfo()
    var user_repin:Int=0
    var user_verified:Int=0
    var verified_content:String=""
    var video_style:Int=0
    //大图
       var large_image:Any?
    
    //MARK 视频内容信息
    /**额外信息**/
    var action_extra = ExtraModel()
    
    //var control_panel:Any?
    //var filter_words:Any?
    var video_detail_info=VideoDetailInfo()
    var is_stick: Bool = false
    //t有视频
    var has_video: Bool = false
    //视频介绍
   var videoDuration: String { return video_duration.convertVideoDuration() }
    var direct_play:Int=0
    var video_id:String=""
    var cursor:TimeInterval=0
    var danmaku_count:Int=0
    var play_auth_token:String=""
    var play_biz_token:String=""
    var forward_count: Int = 0
    var forwardCount: String {
        guard forward_count != 0 else { return "转发" }
        return forward_count.convertString()
    }
    var large_image_list = [LargeImage]()
    //MARK 广告
    var ad_button=THAdvertising()
    var ad_id = 0
    var ad_label = ""
    var sub_title = ""
    var type = "" // app
    var label_style:NewsLabelStyle = .none
    var app_name = ""
    var appleid = ""
    //小视频
 
    //var description = ""
    var web_url = ""
    var user_cards = [UserCard]()
    
    var position = DongtaiPosition()
    
    var repost_params = RepostParam()
    // 来自。。。
    var brand_info = ""
    
    
    
    
    
}



class ImageList:HandyJSON {
     required init(){}
     var type = ImageType.normal
    var height: CGFloat = 0
    
    var url_list = [URLList]()
    
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    var width: CGFloat = 0
    
    var uri: String = ""
    /// 宽高比
    var ratio: CGFloat? { return width / height }
}
//MARK  额外信息
class ExtraModel: HandyJSON {
    required init(){}
    var  channel_id :Int=0
    var action_list = [Action]()
}
struct Action: HandyJSON {
    var extra = Extra()
    var action: Int = 0
    var desc: String = ""
}
struct Extra: HandyJSON {
    
}
struct LogPB: HandyJSON {
    var impr_id: String = ""
}

class ShareInfo: HandyJSON {
    required init(){}
    
    var cover_image = ""
    var description = ""
    var on_suppress = 0
    var token_type = 0
    var share_url = ""
    var title = ""
    
}
/**推荐**/
struct Recommend:HandyJSON {
    var activity=""
    var reason=""
}

/***视频详细信息哦***/

class VideoDetailModel: HandyJSON {
    required init(){}
    var video_preloading_flag: Int = 0
    var direct_play: Int = 0
    var group_flags: Int = 0
    var video_type: Int = 0
    var show_pgc_subscribe: Int = 0
    var video_id: String = ""
    var video_watch_count: Int = 0
    var video_third_monitor_url: String = ""
    var video_watching_count: Int = 0
    var videoWatchingCount: String { return video_watching_count.convertString() }
    var videoWatchCount: String { return video_watch_count.convertString() }
}

class DetailVideoLargeImage: HandyJSON {
    required init(){}
    var height: Int = 0
    var url_list: [URLList]!
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    var width: Int = 0
    var uri: String = ""
}

//class SmallVideo: HandyJSON {
//    required init(){}
//   // let emojiManager = EmojiManager()
//    
//    var rich_title: String = ""
//    var group_id: Int = 0
//    var status = Status()
//    var thumb_image_list = [ThumbImage]()
//    var title: String = ""
//    var attrbutedText: NSMutableAttributedString {
//        return emojiManager.showEmoji(content: title, font: UIFont.systemFont(ofSize: 17))
//    }
//    
//    var create_time: TimeInterval = 0
//    var createTime: String { return create_time.convertString() }
//    
//    var recommand_reason: String = ""
//    var first_frame_image_list = [FirstFrameImage]()
//    var action = SmallVideoAction()
//    var app_download = AppDownload()
//    var app_schema: String = ""
//    var interact_label: String = ""
//    var activity: String = ""
//    var large_image_list = [LargeImage]()
//    var group_source: GroupSource = .huoshan
//    var share = Share()
//    var publish_reason = PublishReason()
//    var music = Music()
//    var title_rich_span: String = ""
//    var user = User()
//    var video = Video()
//    var label: String = ""
//    var label_for_list: String = ""
//    var distance: String = ""
//    var detail_schema: String = ""
//    var item_id: Int = 0
//    var animated_image_list = [AnimatedImage]()
//    var video_neardup_id: Int = 0
//    
//    /// 他们也在用
//    var user_cards = [UserCard]()
//    var has_more = false
//    var id = 0
//    var show_more = ""
//    var show_more_jump_url = ""
//}

struct LargeImage: HandyJSON {
    var type = ImageType.normal
    var height: CGFloat = 0
    
    var url_list = [URLList]()
    
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    
    var width: CGFloat = 0
    
    var uri: String = ""
}

struct VideoDetailInfo: HandyJSON {
    var video_preloading_flag: Int = 0
    var direct_play: Int = 0
    var group_flags: Int = 0
    //var video_url = [VideoURL]()
    var detail_video_large_image = DetailVideoLargeImage()
    var video_third_monitor_url: String = ""
    var video_watching_count: Int = 0
    var videoWatchingCount: String { return video_watching_count.convertString() }
    var video_id: String = ""
    var video_watch_count: Int = 0
    var videoWatchCount: String { return video_watch_count.convertString() }
    var video_type: Int = 0
    var show_pgc_subscribe: Int = 0
}











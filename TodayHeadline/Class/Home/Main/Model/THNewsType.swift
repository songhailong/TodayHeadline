//
//  THNewsType.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/7/2.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THNewsType: NSObject {

}
/***小视频类型***/
enum GroupSource: Int, HandyJSONEnum {
    case huoshan = 16
    case douyin = 19
}
enum CellType: Int, HandyJSONEnum {
    case none = 0
    /// 用户
    case user = 32
    /// 相关关注
    case relatedConcern = 50
}

enum NewsLabelStyle: Int, HandyJSONEnum {
    case none = 0
    case topOrLive = 1      // 置顶或直播
    case ad = 3             // 广告
}

/// 视频类型
enum CardType: String, HandyJSONEnum {
    case video = "video"             // 视频
    case adVideo = "ad_video"        // 广告视频
    case adTextlink = "ad_textlink"  // 广告链接
}
enum ImageType: Int, HandyJSONEnum {
    case normal = 1     // 一般图片
    case gif = 2        // gif 图
}
enum DongtaiGroupMediaType: Int, HandyJSONEnum {
    case postArticle = 1   // 发布了文章
    case postVideo = 2     // 发布了视频
}

//
//  THEnumeration.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/6/26.
//  Copyright © 2019年 靓萌服饰靓萌服饰. All rights reserved.
//

import Foundation
//全局枚举

/// 从哪里进入头条
///
/// - pull: <#pull description#>
/// - loadMore: <#loadMore description#>
/// - auto: <#auto description#>
/// - enterAuto: <#enterAuto description#>
enum TTFrom {
    case pull
    case loadMore
    case auto
    case enterAuto
}
/// 从哪里进入问答控制器
enum WendaEnterFrom: String {
    case dongtai = "dongtai"
    case clickHeadline = "click_headline"
    case clickCategory = "click_category"
}

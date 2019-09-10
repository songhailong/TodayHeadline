//
//  THHeader.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/6/26.
//  Copyright © 2019年 靓萌服饰靓萌服饰. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

//屏幕宽高
let screenWidth = CGFloat(UIScreen.main.bounds.width)
let screenHeight = CGFloat(UIScreen.main.bounds.height)
let device_id: Int = 41312231473
let iid: Int = 17769976909
//没有找到三木运算代替
let isIphoneX:Bool = IphoneX()
func IphoneX()->Bool{
    
   let scale = UIScreen.main.scale
    
    
    if (screenWidth*scale)==828||screenWidth*scale==1125||screenWidth*scale==1242{
        return true
    }else{
        return false
    }
}


let BASE_URL = "https://is.snssdk.com"
let TH_BASE_URL = "https://www.toutiao.com/"

//三木运算符 要空格
let stausHeight = isIphoneX ? CGFloat(44.0):CGFloat(20.0)

let NavHeight=isIphoneX ?CGFloat(88.0): CGFloat(64.0)

let tabBarHeight=isIphoneX ? CGFloat(49.0+34.0):CGFloat(49.0)

let tabBarstause=isIphoneX ? CGFloat(34.0):CGFloat(0)

func THRGBColor(R:CGFloat,G:CGFloat,B:CGFloat) -> UIColor {
    let color=UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1.0)
    return color
}



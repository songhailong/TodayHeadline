//
//  UIColor+Categary.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/6/28.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import Foundation
class UIColor_Categary: UIColor {

}


extension UIColor{
    //        self.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(displayP3Red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
   public  class func RGBColor(R:Int,G:Int,B:Int) -> UIColor {
        let color=UIColor.init(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha: 1.0)
        return color
    }
    /// 背景灰色 f8f9f7
    class func globalBackgroundColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247)
    }
    class func mainBackgroundColor() -> UIColor {
        return UIColor(r: 228, g: 101, b: 98)
    }
}

//
//  THAnimationManager.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/23.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
let  animationDuration:CGFloat = 0.25;
let  popViewInsert:CGFloat = 5;
class THAnimationManager: NSObject {
   class  func getShowPopAnimation(popType:PopDirection,contentView:UIView,belowView:UIView) -> CABasicAnimation {
        let showAnima=CABasicAnimation()
        //时长
        showAnima.duration=CFTimeInterval(animationDuration)
        
        showAnima.repeatCount=1
        showAnima.fillMode = CAMediaTimingFillMode.forwards
        showAnima.isRemovedOnCompletion=true
        
        let width=contentView.bounds.size.width
        let height=contentView.bounds.size.height
        let ScreenWidth=UIScreen.main.bounds.size.width
        let ScreenHeight=UIScreen.main.bounds.size.height
        switch popType {
        case .PopUpNone:
            showAnima.keyPath="transform"
            let tofrom=CATransform3DMakeScale(1, 1, 1)
            let from=CATransform3DMakeScale(0, 0, 1)
            showAnima.fromValue=NSValue.init(caTransform3D: from)
            showAnima.toValue=NSValue.init(caTransform3D: tofrom)
            break
        case .SlideInCenter:
            break
        case .SlideFromLeft:
            break
        case .SlideFromRight:
            break
        case .SlideFromBottom:
            break
        case .SlideFromUp:
            break
        default:
            break
            
        }
        
        
        
        return showAnima
    }
    
    
    
  class  func getHidePopAnimation(popType:PopDirection,contentView:UIView,belowView:UIView) -> CABasicAnimation {
        let HideAnima=CABasicAnimation()
        //时长
        HideAnima.duration=CFTimeInterval(animationDuration)
        
        HideAnima.repeatCount=1
        HideAnima.fillMode = CAMediaTimingFillMode.forwards
        HideAnima.isRemovedOnCompletion=true
    switch popType {
    case .PopUpNone:
        HideAnima.keyPath="transform"
        let tofrom=CATransform3DMakeScale(0, 0, 1)
        let from=CATransform3DMakeScale(1, 1, 1)
        HideAnima.fromValue=NSValue.init(caTransform3D: from)
        HideAnima.toValue=NSValue.init(caTransform3D: tofrom)
        break
    case .SlideInCenter:
        break
    case .SlideFromLeft:
        break
    case .SlideFromRight:
        break
    case .SlideFromBottom:
        break
    case .SlideFromUp:
        break
    default:
        break
        
    }
    
    
        return HideAnima
    }
    
    
    
    
}

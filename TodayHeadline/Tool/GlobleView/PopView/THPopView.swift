//
//  THPopView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/22.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THPopView: UIView {
    var willRemovedFromeSuperView:(()->())?
    
    
    var popViewTag = 364
    
    ///
    var showAnimation:CABasicAnimation?
    var hidenAnimation:CABasicAnimation?
    var contentView=UIView()
    var onView=UIView()
    var triangleView=UIView()
    var direct:PopDirection = .PopUpNone
    var  offset:CGFloat=0
//    func init(frame: CGRect,direct:PopDirection,onView:UIView,contentView:UIView,offset:CGFloat,triangleView:UIView,animation:Bool) {
//        
//    }
    
    
    
    
//    class func popContentView(contentView:UIView,showAnimation:CABasicAnimation,hidenAnimation:CABasicAnimation) -> THPopView {
//
//      }
    
    
//    func getCurrentPopView() -> THPopView {
//        let window=UIApplication.shared.windows
//        
//    }
    
   class func popUpContentView(contentView:UIView,direct:PopDirection,onView:UIView) -> THPopView {
        return self.popUpContentView(contentView: contentView, direct: direct, onView: onView, offset: 0, triangleView: UIView(), animation: true)
    }
    
    
    
    /// <#Description#>
    ///
    /// - Parameters:可实现类似QQ和微信消息页面的右上角微型菜单弹窗
    ///   - contentView: 要显示的控件内容
    ///   - direct: 方向
    ///   - onView: 一般是响应事件的按钮
    ///   - offset: 一般是响应事件的按钮
    ///   - triangleView: 可以自定义的任意的view来替代三角指示控件
    ///   - animation: 是否动画
    
  class  func popUpContentView(contentView:UIView,direct:PopDirection,onView:UIView,offset:CGFloat,triangleView:UIView,animation:Bool) -> THPopView {
        
        let windows=UIApplication.shared.keyWindow
        //底层的页面
        let newPopView=THPopView.init(frame: windows!.bounds, onView: onView, direct: direct, contenView: contentView, offSet: offset, triangleView: triangleView, animation: animation)
        newPopView.showAnimation=THAnimationManager.getShowPopAnimation(popType: direct, contentView: contentView, belowView:UIView())
        newPopView.hidenAnimation=THAnimationManager.getHidePopAnimation(popType: direct, contentView: contentView, belowView: UIView())
            newPopView.setPopMenuSubViewFrame()
        windows?.addSubview(newPopView)
        newPopView.setPopMenuSubViewFrame()
        newPopView.animationPopContainerViewWithOldPopView(oldPopView: UIView() as! THPopView)
        newPopView.bringSubviewToFront(newPopView.popContainerView)
        return newPopView
    }
  
   
    
    
    init(frame: CGRect,onView:UIView,direct:PopDirection,contenView:UIView,offSet:CGFloat,triangleView:UIView,animation:Bool) {
        super.init(frame: frame)
        self.direct=direct
        self.contentView=contenView
        self.triangleView=triangleView
        self.onView=onView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animationPopContainerViewWithOldPopView(oldPopView:THPopView)  {
//        if oldPopView != nil{
//            if oldPopView.willRemovedFromeSuperView != nil{
//                //oldPopView.willRemovedFromeSuperView()
//            }
//            oldPopView.removeFromSuperview()
//        }
        guard let color=self.backgroundColor else {
            UIColor.black
            return  }
        self.popContainerView.layer.add(self.showAnimation!, forKey: nil)
        
        animationBackGroundColor(fromeColor: UIColor.clear, toColor: color)
    }
    
    /// 设置背景色
    ///
    /// - Parameters:
    ///   - fromeColor: <#fromeColor description#>
    ///   - toColor: <#toColor description#>
    func animationBackGroundColor(fromeColor:UIColor,toColor:UIColor)   {
        let animation = CABasicAnimation.init(keyPath: "backgroundColor")
        animation.fromValue=fromeColor.cgColor
        animation.toValue=toColor.cgColor
        animation.duration=CFTimeInterval(animationDuration)
        animation.fillMode=CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        self.layer.add(animation, forKey: "backgroundColor")
    }
    
    
    
    /// 设置弹出的Frame
    func setPopMenuSubViewFrame()  {
        //三角的位置
        var triangleFrame=self.triangleView.bounds
        var contentFrame=self.contentView.bounds
         var popContentFrame=CGRect.zero
        //如果view为nil，则此方法将转换为窗口基坐标  计算在窗口的坐标
        var onViewFrame=self.onView.convert(self.onView.bounds, to: nil)
        //设置锚点
        var anchorponit=CGPoint.init(x: 0.5, y: 0)
        let window=UIApplication.shared.keyWindow
        switch self.direct {
        case .PopUpTop:
            //计算三角形的位置
            triangleFrame.origin.y=onViewFrame.origin.y+onViewFrame.height
            triangleFrame.origin.x=onViewFrame.origin.x + onViewFrame.size.width/2 - triangleFrame.size.width/2
            
            //计算展示的view的坐标
            contentFrame.origin.y = triangleFrame.origin.y+triangleFrame.size.height
            contentFrame.origin.x = onViewFrame.origin.x + onViewFrame.size.width/2 - contentFrame.size.width/2 + self.offset
            if contentFrame.origin.x<popViewInsert{
                 contentFrame.origin.x = popViewInsert
            }
            if  contentFrame.origin.x+contentFrame.size.width>screenWidth{
                contentFrame.origin.x = window!.bounds.size.width - popViewInsert - contentFrame.size.width
            }
            //计算三角形展示的位置
            self.triangleView.frame = triangleFrame
            window?.addSubview(self.triangleView)
            popContentFrame = triangleFrame.union(contentFrame)
            self.popContainerView.frame = popContentFrame
            self.triangleView.frame=self.triangleView.convert(self.triangleView.bounds, to: self.popContainerView)
            self.popContainerView.addSubview(self.triangleView)
            //计算内容的位置
            self.contentView.frame = contentFrame
            window!.addSubview(self.contentView)
            self.contentView.frame=self.contentView.convert(self.contentView.bounds, to: self.popContainerView)
//            self.popContainerView.addSubview(self.contentView)
//            anchorponit.y = 1
//            anchorponit.x = (self.triangleView.frame.origin.x + self.triangleView.frame.size.width/2)/popContentFrame.size.width
//            self.popContainerView.layer.anchorPoint = anchorponit
//
//            print(onViewFrame.size.width)
//
//
//            self.popContainerView.frame=CGRect.init(x: onViewFrame.origin.x + onViewFrame.size.width/2, y: onViewFrame.origin.y+onViewFrame.size.height, width: popContentFrame.size.width, height: popContentFrame.size.height)
            
            
            break
        
        case .PopUpBottom:
            break
        
        case .PopUpBottom:
            break
        default: break
            
        }
    }
    
    
    
    
    /// 懒加载 显示的View
    lazy var popContainerView: UIView = {
        let popContainerView=UIView()
        self.addSubview(popContainerView)
        return popContainerView
    }()
    
}

enum PopDirection:Int{
     case PopUpLeft=0
     case PopUpBottom=1
     case PopUpRight=2
     case PopUpTop=3
     case PopUpNone=4
     case SlideFromLeft=5
    case SlideFromRight=6
    case SlideFromUp=7
    case SlideFromBottom=8
    case SlideInCenter=9
    case SlideBelowView=10
}


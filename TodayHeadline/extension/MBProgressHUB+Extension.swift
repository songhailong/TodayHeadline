//
//  MBProgressHUB+Extension.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/21.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class MBProgressHUB_Extension: UIView {



}
extension MBProgressHUD{
    
    private class func show(_ text: String?, icon: String?) {
        
        guard let view:UIView = UIApplication.shared.keyWindow else { return }
        // 快速显示一个提示信息
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        // 允许背景可点击
        hud.isUserInteractionEnabled = false
        hud.label.text = text
        // 设置图片
        if let icon = icon {
            let image = UIImage(named: "JXMBProgressHUD.bundle/\(icon)")?.withRenderingMode(.alwaysTemplate)
            hud.customView = UIImageView(image: image)
        }
        // 再设置模式
        hud.mode = .customView
        hud.isSquare = true
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true
        // 0.9秒之后再消失
        hud.hide(animated: true, afterDelay: 0.89)
    }
    
    private class func showMessage(_ message: String?, btnTitle: String?, target: Any?, action: Selector) {
        guard let view:UIView = UIApplication.shared.keyWindow else { return }
        // 快速显示一个提示信息
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        // 允许背景可点击
        hud.isUserInteractionEnabled = false
        hud.label.text = message
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true
        // 需要蒙版效果
        hud.backgroundView.style = .solidColor
        hud.backgroundView.color = UIColor(white: 0.0, alpha: 0.1)
        hud.button.setTitle(btnTitle, for: .normal)
        hud.button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    /// 仅显示文字提示
    public class func showToast(_ message: String?) {
        guard let view:UIView = UIApplication.shared.keyWindow else { return }
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        // 允许背景可点击
        hud.isUserInteractionEnabled = false
        hud.mode = .text
        hud.label.text = message
        hud.offset = CGPoint(x: 0.0, y: MBProgressMaxOffset - 49)
        hud.hide(animated: true, afterDelay: 2)
    }
    
    /// 显示菊花
    public class func show(_ message: String?) -> MBProgressHUD? {
        guard let view:UIView = UIApplication.shared.keyWindow else { return nil}
        // 快速显示一个提示信息
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.isUserInteractionEnabled = false
        hud.label.text = message
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true
        // 需要蒙版效果
        hud.backgroundView.style = .solidColor
        hud.backgroundView.color = UIColor(white: 0.0, alpha: 0.1)
        return hud
    }
    
    /// 普通提示
    public class func showInfo(_ message: String?) {
        self.show(message, icon: "info")
    }
    /// 线束正确提示
    public class func showSuccess(_ message: String?) {
        self.show(message, icon: "success")
    }
    /// 显示错误提示
    public class func showError(_ message: String?) {
        self.show(message, icon: "error")
    }
    /// 隐藏
    public class func hide() {
        guard let view:UIView = UIApplication.shared.keyWindow else { return }
        self.hide(for: view, animated: true)
    }
    
  class  func showCustomStatusAnimation(view:UIView){
      let HUD=MBProgressHUD.showAdded(to: view, animated: true)
       HUD.bezelView.backgroundColor=UIColor.clear
       HUD.mode=MBProgressHUDMode.customView
       //HUD.backgroundColor=UIColor.gray
    //实质是黑色的弹框的大小是依据中间的detailsLabel的宽度来做约束的，所以你只要限制中间detailsLabel的宽度就可以了。
    
    
    
    //MBProgressHUD是根据你给定的图片大小来约束大小，所以你要图片显示多大，你就叫UI给你这种尺寸的切图就可以了
       HUD.isSquare=true
      let imageViewGif=UIImageView()
     var imags=[UIImage]()
        imags.append(UIImage.init(named: "details_slogan01")!)
    imags.append(UIImage.init(named: "details_slogan01_night")!)
        imags.append(UIImage.init(named: "details_slogan02")!)
    imags.append(UIImage.init(named: "details_slogan01_night")!)
//        imags.append(UIImage.init(named: "dragloading_0")!)
//      imags.append(UIImage.init(named: "dragloading_1")!)
//      imags.append(UIImage.init(named: "dragloading_2")!)
//      imags.append(UIImage.init(named: "dragloading_3")!)
       imageViewGif.animationImages=imags
        imageViewGif.animationDuration=1
        imageViewGif.animationRepeatCount=0
        imageViewGif.startAnimating()
    
     HUD.removeFromSuperViewOnHide=true
       HUD.customView=imageViewGif
        
    }
    
    
    class func showDefaulactivity(view:UIView,dimBackground:Bool) -> MBProgressHUD {
        let hub=MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode=MBProgressHUDMode.indeterminate
        hub.backgroundColor=UIColor.clear
       hub.removeFromSuperViewOnHide=true
       //小菊花默认是白色
       hub.bezelView.backgroundColor=UIColor.clear
        
        return hub
    }
    
    /// 自定义圆圈转动
    ///
    /// - Parameter view: <#view description#>
 class   func showCustemActivity(view:UIView)  {
        let HUD=MBProgressHUD.showAdded(to: view, animated: true)
        HUD.bezelView.style=MBProgressHUDBackgroundStyle.solidColor
        HUD.bezelView.backgroundColor=UIColor.clear
    
        HUD.mode=MBProgressHUDMode.customView
        //HUD.backgroundColor=UIColor.gray
        //实质是黑色的弹框的大小是依据中间的detailsLabel的宽度来做约束的，所以你只要限制中间detailsLabel的宽度就可以了。
        
        
        
        //MBProgressHUD是根据你给定的图片大小来约束大小，所以你要图片显示多大，你就叫UI给你这种尺寸的切图就可以了
        HUD.isSquare=true
        let imageViewGif=UIImageView()
        var imags=[UIImage]()
       
            imags.append(UIImage.init(named: "dragloading_0")!)
          imags.append(UIImage.init(named: "dragloading_1")!)
           imags.append(UIImage.init(named: "dragloading_2")!)
        imags.append(UIImage.init(named: "dragloading_3")!)
        imags.append(UIImage.init(named: "dragloading_4")!)
        imags.append(UIImage.init(named: "dragloading_5")!)
        imags.append(UIImage.init(named: "dragloading_6")!)
        imags.append(UIImage.init(named: "dragloading_7")!)
        imageViewGif.animationImages=imags
        imageViewGif.animationDuration=1
        imageViewGif.animationRepeatCount=0
        imageViewGif.startAnimating()
        
        HUD.removeFromSuperViewOnHide=true
        HUD.customView=imageViewGif
        
    }
    
    
    
    
    
}

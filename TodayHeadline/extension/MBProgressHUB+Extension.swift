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
    
}

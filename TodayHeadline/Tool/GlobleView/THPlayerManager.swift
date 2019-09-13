//
//  THPlayerManager.swift
//  TodayHeadline
//


import UIKit

class THPlayerManager: BMPlayer {

    //“懒实例化”的全局变量会被自动放在dispatch_once块中
    //需要提前加载avplayer
    static let sharedManager: THPlayerManager = {
        let instance = THPlayerManager.init(customControlView:BMPlayerControlView())
        instance.setVideo(resource: BMPlayerResource.init(url: URL.init(string: "aHR0cDovL3Y5LWRlZmF1bHQuaXhpZ3VhLmNvbS8yZjViZTJiMDNmNTc0YThhYTE3OGNhZDRlNDNmMWY5ZS81ZDZmMzUyOC92aWRlby9tLzIyMDU1YmQzNjE2MWFhMDQyYzM4NzBlNmI1MDZiMTQ2MTNjMTE2MzU2N2FhMDAwMDdlMTc3NjU4ZDc5NC8/YT0yMDEyJmJyPTk3NCZjcj0wJmNzPTAmZHI9MCZkcz0yJmVyPSZsPTIwMTkwOTA0MTA1MDQyMDEwMDE0MDQ4MTQwMTBENDFDNkQmbHI9JnJjPU0ydG1QRE53WjNFMmJ6TXpaemN6TTBBcGFHWTdOVHd6TXp3Mk56bGxORFE3YUdjdE5EVTBhMmRpTW10ZkxTMHRMVEJ6Y3pZdU16QmlNek15TkM5Z01sNHdMbDg2WXclM0QlM0Q=")!))
           instance.playerLayer?.placeholderView.image=UIImage.init(named: "loading_bgView")
        
        instance.pause()
        return instance
    }()
    
    
    open func pasuPlayingfromCellSuperview (){
        self.pause()
        self.prepareToDealloc()
        self.removeFromSuperview()
    }
    
    

}

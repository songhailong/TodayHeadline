//
//  SmallVideoPlayerCustomView.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/9.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class SmallVideoPlayerCustomView: BMPlayerControlView {

    override func customizeUIComponents() {
        BMPlayerConf.topBarShowInCase = .none
       playButton.removeFromSuperview()
        currentTimeLabel.removeFromSuperview()
        totalTimeLabel.removeFromSuperview()
        timeSlider.removeFromSuperview()
        fullscreenButton.removeFromSuperview()
        progressView.removeFromSuperview()
    }

}

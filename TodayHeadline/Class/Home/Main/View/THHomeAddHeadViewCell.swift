//
//  THHomeAddHeadViewCell.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/7/18.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHomeAddHeadViewCell: UICollectionReusableView {
    var isEdit=false
    
    lazy var eidButton:UIButton = {
        let eidButton=UIButton()
        eidButton.setTitle("编辑", for: .normal)
        eidButton.titleLabel?.textColor=THRGBColor(R: 207, G: 84, B: 83)
        return eidButton
    }()
    
    lazy var jonechannelBtn: UIButton = {
        let jonechannelB=UIButton()
        jonechannelB.setTitle("点击进入频道", for: .normal)
        jonechannelB.titleLabel?.textColor=UIColor.gray
        return jonechannelB
    }()
    lazy var channelBtn: UIButton = {
        let channelB=UIButton()
        channelB.setTitle("我的频道", for: .normal)
        channelB.titleLabel?.textColor=UIColor.black
        return channelB
    }()

}

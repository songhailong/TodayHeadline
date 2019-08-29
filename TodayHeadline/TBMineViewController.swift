//
//  TBMineViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/6/26.
//  Copyright © 2019年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import SQLite.Swift

class TBMineViewController: THBassViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MBProgressHUD.showCustomStatusAnimation(view: self.view)
        //MBProgressHUD.showDefaulactivity(view:self.view,dimBackground:false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

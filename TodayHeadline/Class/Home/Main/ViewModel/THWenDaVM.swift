//
//  THWenDaVM.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/8/15.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON
class THWenDaVM: NSObject {
    
   class func loadProposeQuestionBrow(qid: Int, enterForm: WendaEnterFrom, completionHandler: @escaping (_ wenda: THWendaAnswer) -> ()) {
        let url = BASE_URL + "/wenda/v1/question/brow/?device_id=\(device_id)&iid=\(iid)"
        let params = ["qid": qid,
                      "enter_form": enterForm] as [String : Any]
        THHttpTool.getLoadDate(url: url, parameters: params) { (respond) in
            let date = JSON(respond)
            print("问答刷新\(date)")
        guard date["message"] == "success" else { return }
            
        }
       
    }
    
    
    class  func loadMoreProposeQuestionBrow(qid: Int, offset: Int, enterForm: WendaEnterFrom,completionHandler:@escaping (_ wenda:THWendaAnswer) -> ()) {
        let url = BASE_URL + "/wenda/v1/question/loadmore/?device_id=\(device_id)&iid=\(iid)"
        let params = ["qid": qid,
                      "count": 20,
                      "offset": offset,
                      "enter_form": enterForm] as [String : Any]
        THHttpTool.getLoadDate(url: url, parameters: params) { (respond) in
            
        }
       
    }
    
    
    
}

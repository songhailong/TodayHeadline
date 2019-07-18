//
//  THHttpTool.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/6/26.
//  Copyright © 2019年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import Alamofire
class THHttpTool {
  class  func getLoadDate(url:String,parameters:[String:Any]?=nil,finishCallBack:@escaping(_ result:Any)->())  {
    
    Alamofire.request(url, method: HTTPMethod.get, parameters: parameters).responseJSON { (DataResponse) in
        guard let result=DataResponse.result.value else {
        print("提示网络不给力")
        return}
        finishCallBack(result)
    }
    
    }
    
  //@escaping  是逃逸闭包
    
class  func PostLoadDate(url:String,parameters:[String:Any]?=nil,finishCallBack:@escaping(_ result:Any)->())  {
        
        Alamofire.request(url, method: HTTPMethod.post, parameters: parameters).responseJSON { (DataResponse) in
            guard let result = DataResponse.result.value else {
                print("提示网络不给力")
                return}
            
            
            
            finishCallBack(result)
        }
        
    }
    
    
}

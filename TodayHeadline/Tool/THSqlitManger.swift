//
//  THSqlitManger.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/6/27.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import SQLite
class THSqlitManger : NSObject {
    var database:Connection!
    //在单例类中，有一个用来共享数据的数组
    var datas = [String]()
    //创建一个静态或者全局变量，保存当前单例实例值
    private static let manager = THSqlitManger()
    //私有化构造方法
    private override init() {
        //给数组加一个原始数据
        datas.append("SI")
    }
    
    
    
    //提供一个公开的用来去获取单例的方法
    class func defaultSqlitManager() ->THSqlitManger {
        
       
        
        
        
        //返回初始化好的静态变量值
        return manager
    }
    
    func connectSqlit()  {
        do {
            //Document要在Document文件夹下创建一个名为db.sqlite3的数据库，并且要连接数据库
            let path = NSHomeDirectory() + "/Documents/news.sqlite3"
            //如果不存在的话，创建一个名为db.sqlite3的数据库，并且连接数据库
           database = try Connection(path)
        } catch { print(error) }
    }
}

/// 首页新闻分类的标题数据表
struct NewsTitleTable {
    /// 数据库管理者
    private let sqlManager = THSqlitManger.defaultSqlitManager()
    /// 新闻标题 表
    private let news_title = Table("news_title")
    
    /// 表字段
    let id = Expression<Int64>("id")
    let category = Expression<String>("category")
    let tip_new = Expression<Int64>("tip_new")
    let default_add = Expression<Int64>("default_add")
    let web_url = Expression<String>("web_url")
    let concern_id = Expression<String>("concern_id")
    let icon_url = Expression<String>("icon_url")
    let flags = Expression<Int64>("flags")
    let type = Expression<Int64>("type")
    let name = Expression<String>("name")
    let selected = Expression<Bool>("selected")
    init() {
        // 建表
        try! sqlManager.database.run(news_title.create(ifNotExists: true, block: { t in
            t.column(id, primaryKey: true)
            t.column(category)
            t.column(tip_new)
            t.column(default_add)
            t.column(web_url)
            t.column(concern_id)
            t.column(icon_url)
            t.column(flags)
            t.column(type)
            t.column(name)
            t.column(selected)
        }))
    }
    
    /**插入一条数据***/
    func insert(_ title: THNewsTitleModel) {
        /// 如果数据库中该条数据数据不存在，就插入
        if !exist(title) {
            let insert = news_title.insert(category <- title.categoryType.rawValue, tip_new <- Int64(title.tip_new), default_add <- Int64(title.default_add), concern_id <- title.concern_id, web_url <- title.web_url, icon_url <- title.icon_url, flags <- Int64(title.flags), type <- Int64(title.type), name <- title.name, selected <- title.selected)
            /// 插入数据
            try! sqlManager.database.run(insert)
        }
    }
    /// 判断数据库中某一条数据是否存在
    func exist(_ title: THNewsTitleModel) -> Bool {
        // 取出该新闻分类标题的数据
        let title = news_title.filter(category == title.categoryType.rawValue)
        // 判断该条数据是否存在，没有直接的方法
        // 可以根据 count 是否是 0 来判断是否存在这条数据，0 表示没有该条数据，1 表示存在该条数据
        let count = try! sqlManager.database.scalar(title.count)
        return count != 0
    }
    
    /// 查询所有数据
    func selectAll() -> [THNewsTitleModel] {
        var allTitles = [THNewsTitleModel]()
        // 遍历表中数据
        for title in try! sqlManager.database.prepare(news_title) {
            // 取出表中数据，并初始化为一个结构体模型
//            let newsTitle = THNewsTitleModel(category: NewsTitleCategory(rawValue: title[category])!, tip_new: Int(title[tip_new]), default_add: Int(title[default_add]), web_url: title[web_url], concern_id: title[concern_id], icon_url: title[icon_url], flags: Int(title[flags]), type: Int(title[type]), name: title[name], selected: title[selected])
//            // 添加到数组中
            
             //let newsTitle=THNewsTitleModel.mj_object(withKeyValues: title) 
            
            
            allTitles.append(THNewsTitleModel.mj_object(withKeyValues: title))
        }
        return allTitles
        // 不再使用 map 方式
        //        let newsTitles = try! sqlManager.database.prepare(news_title)
        //        return newsTitles.map({ title in
        //            // 取出表中数据，并初始化为一个结构体模型
        //            HomeNewsTitle(category: title[category], tip_new: Int(title[tip_new]), default_add: Int(title[default_add]), web_url: title[web_url], concern_id: title[concern_id], icon_url: title[icon_url], flags: Int(title[flags]), type: Int(title[type]), name: title[name], selected: title[selected])
        //        })
    }
    
    /// 更新数据
    func update(_ newsTitle: THNewsTitleModel) {
        // 取出数据库中数据
        let title = news_title.filter(category == newsTitle.categoryType.rawValue)
        // 更新数据
        try! sqlManager.database.run(title.update(selected <- newsTitle.selected))
    }
    
}



//
//  THTextTable.swift
//  News
//
//  Created by 宋海龙 on 2019/8/6.
//  Copyright © 2019 hrscy. All rights reserved.
//

import UIKit
import SQLite
class THTextTable: NSObject {
     private let manager=THSqlitManger.defaultSqlitManager()
    
    
    /// 表字段
    let id = Expression<Int64>("id")
    let text = Expression<Data>("text")
    let textID=Expression<String>("textid")
    let userID=Expression<Int64>("userid")
    private var tableName:String=""
    func creatTable(tablename:String)  {
        let text_title = Table(tablename)
        self.tableName=tablename
        try! manager.database.run(text_title.create(ifNotExists: true,block:{ (t) in
            
            /**t.column(id, primaryKey: true)
             // "id" INTEGER PRIMARY KEY NOT NULL
             
             t.column(id, primaryKey: .autoincrement)
             // "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
             
             t.column(email, unique: true)
             // "email" TEXT UNIQUE NOT NULL
             
             t.column(email, check: email.like("%@%"))
             // "email" TEXT NOT NULL CHECK ("email" LIKE '%@%')
             
             t.column(name, defaultValue: "Anonymous")
             // "name" TEXT DEFAULT 'Anonymous'
             
             t.column(email, collate: .nocase)
             // "email" TEXT NOT NULL COLLATE "NOCASE"
             t.column(name, collate: .rtrim)
             // "name" TEXT COLLATE "RTRIM"
             
             t.column(user_id, references: users, id)
             // "user_id" INTEGER REFERENCES "users" ("id")****/
            //自增长字段
            t.column(id, primaryKey: true)
            t.column(text)
            
            //设置唯一
            t.column(textID,unique: true)
            t.column(userID)
        }))
    }

    func insertData(textDic:[String:Any])  {
        let text_title = Table(tableName)
        //需要归档
        let textData:Data = try! NSKeyedArchiver.archivedData(withRootObject: textDic, requiringSecureCoding: true) as Data
        let insert=text_title.insert(text <- textData,textID <- textDic["item_id"] as! String,userID <- Int64(iid) )
       try! manager.database.run(insert)
    }
//    /**判断是否存在***/
//    func exist(textid:String,tableName:String) ->Bool {
//        let text_title = Table(tableName)
//        let title=text_title.filter(textID == textid)
//
//     return true
//    }
    /***查询**/
    func selectText() -> [[String:Any]] {
        var texts=[[String:Any]]()
        let text_title = Table(tableName)
        for title in try! manager.database.prepare(text_title) {
            let textdata=title[text]
            //解档
            let acount=try!NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(textdata)
            texts.append(acount as! [String : Any])
        }
        
        
        //需要归档
        return texts
    }
   
    ///
    ///
    /// - Parameter newsTitle: 更新数据
    func update(_ newsTitle: [String:Any]) {
       
    }
     
}

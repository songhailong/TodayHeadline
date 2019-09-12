//
//  TBShortVideoViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/6/26.
//  Copyright © 2019年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class TBShortVideoViewController: THBassViewController {
    private lazy var player = THPlayerManager.sharedManager
   private var pageView:JXSegmentedView?
    var titles = [THNewsTitleModel]()
    let TitleNewsH:CGFloat=40.0
    private var segmentedDataSource=JXSegmentedTitleDataSource()
    private var listContainerView:JXSegmentedListContainerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        //player.pause()
         creatUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player.pause()
    }
    
    
   
    func creatUI()  {
          let model = THNewsTitleModel()
        model.loadSmallVideoCategoriesTitle{ (THNewsTitleModels) in
            self.titles=THNewsTitleModels
            self.titles.append(model)
            
            
            
            self.pageView = JXSegmentedView.init(frame: CGRect.init(x: CGFloat(0), y: CGFloat(stausHeight), width: screenWidth, height: self.TitleNewsH))
            self.pageView?.delegate=self as? JXSegmentedViewDelegate
            self.view.addSubview(self.pageView!)
            var titsarr = Array<Any>()
            for(index, item)in self.titles.enumerated() {
                
                let model:THNewsTitleModel=self.titles[index] as! THNewsTitleModel
                //print("\((model.name,model.category,model.default_add))")
                titsarr.append (model.name)
               
            }
            
           
           
            self.segmentedDataSource.titles = titsarr as! [String]
            self.segmentedDataSource.isTitleColorGradientEnabled = true
            //reloadData(selectedIndex:)方法一定要调用，方法内部会刷新数据源数组
            self.segmentedDataSource.reloadData(selectedIndex: 0)
            //关联dataSource
            self.pageView?.dataSource = self.segmentedDataSource
            let indicator = JXSegmentedIndicatorLineView()
            indicator.indicatorWidth = 20
            self.pageView?.indicators = [indicator]
            
            
            
            self.listContainerView = JXSegmentedListContainerView.init(dataSource: self)
            self.listContainerView?.frame=CGRect.init(x: 0.0, y: CGFloat(stausHeight)+self.TitleNewsH, width: screenWidth, height: screenHeight-CGFloat(stausHeight)-self.TitleNewsH-CGFloat(tabBarHeight))
            self.view.addSubview(self.listContainerView!)
            //关联cotentScrollView，关联之后才可以互相联动！！！
            //self.pageView?.contentScrollView = self.listContainerView?.scrollView
            
            
        }
    }


}
extension TBShortVideoViewController:JXSegmentedViewDelegate,JXSegmentedListContainerViewDataSource{
    
    
    //点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，而不关心具体是点击还是滚动选中的情况。
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        self.listContainerView?.didClickSelectedItem(at: index)
    }
    
    // 点击选中的情况才会调用该方法
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {}
    
    // 滚动选中的情况才会调用该方法
    func segmentedView(_ segmentedView: JXSegmentedView, didScrollSelectedItemAt index: Int) {}
    
    // 正在滚动中的回调
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        self.listContainerView?.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
        
    }
    
    
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return self.segmentedDataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        return THHuoshanBassVC() as JXSegmentedListContainerViewListDelegate
    }
    
    
}

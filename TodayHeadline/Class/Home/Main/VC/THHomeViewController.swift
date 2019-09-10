//
//  THHomeViewController.swift
//  TodayHeadline
//
//  Created by 靓萌服饰靓萌服饰 on 2019/6/26.
//  Copyright © 2019年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import SGPagingView
import RxSwift
class THHomeViewController: THBassViewController {
    
    let TitleNewsH:CGFloat=40.0
    
    //标题控件和滑动控件
    private var segmentedView:JXSegmentedView?
    var titles:[Any]?
    private var segmentedDataSource=JXSegmentedTitleDataSource()
    private var listContainerView:JXSegmentedListContainerView?
    private lazy var navgateView=THNavigateView.init(frame: CGRect.init(x: 0, y: 0, width: Int(screenWidth), height: Int(NavHeight)))
    //加号按钮
  
    lazy var addButton: UIButton = {
        let addButton=UIButton.init(frame: CGRect.init(x: screenWidth-TitleNewsH, y: CGFloat(NavHeight), width: TitleNewsH, height: TitleNewsH))
        addButton.setImage(UIImage.init(named: "add_channel_titlbar_thin_new_16x16_"), for: .normal)
        addButton.backgroundColor=UIColor.white
        addButton.addTarget(self, action: #selector(addBtnClick), for: UIControl.Event.touchUpInside)
        return addButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        configUI()
        clickAction()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden=false
    }
    
    lazy var listtable: THPopTableView = {
        let listtable=THPopTableView()
        //设置数据 和代理
        return listtable
    }()
    
    
}

extension THHomeViewController{
    private func configUI()  {
        self.view.backgroundColor=UIColor.white
        self.view .addSubview(navgateView)
       
        let model = THNewsTitleModel()
        model.loadTitleData { (THNewsTitleModels) in
            
            //请求完成
            //先添加缓存
            //创建标题滑动栏
            self.titles=THNewsTitleModels
            
            self.segmentedView = JXSegmentedView.init(frame: CGRect.init(x: CGFloat(0), y: CGFloat(NavHeight), width: screenWidth, height: self.TitleNewsH))
            self.segmentedView?.delegate=self as JXSegmentedViewDelegate
            self.view.addSubview(self.segmentedView!)
            //配置数据源相关配置属性
            var titsarr = Array<Any>()
            for(index, item)in self.titles!.enumerated() {
                
                let model:THNewsTitleModel=self.titles?[index] as! THNewsTitleModel
                //print("\((model.name,model.category,model.default_add))")
                titsarr.append (model.name)
            }
            
         
            
            self.segmentedDataSource.titles = titsarr as! [String]
            self.segmentedDataSource.isTitleColorGradientEnabled = true
            //reloadData(selectedIndex:)方法一定要调用，方法内部会刷新数据源数组
            self.segmentedDataSource.reloadData(selectedIndex: 0)
            //关联dataSource
            self.segmentedView?.dataSource = self.segmentedDataSource
            let indicator = JXSegmentedIndicatorLineView()
            indicator.indicatorWidth = 20
            self.segmentedView?.indicators = [indicator]
            
            
            
            self.listContainerView = JXSegmentedListContainerView.init(dataSource: self)
            self.listContainerView?.frame=CGRect.init(x: 0.0, y: CGFloat(NavHeight)+self.TitleNewsH, width: screenWidth, height: screenHeight-CGFloat(NavHeight)-self.TitleNewsH-CGFloat(tabBarstause))
            self.view.addSubview(self.listContainerView!)
            //关联cotentScrollView，关联之后才可以互相联动！！！
            self.segmentedView?.contentScrollView = self.listContainerView?.scrollView
            
//            let titleBtn=SGPageTitleViewConfigure.init()
//            titleBtn.titleColor = .black
//            titleBtn.titleSelectedColor = UIColor.globalBackgroundColor()
//            titleBtn.indicatorColor = .clear
//
//            self
//
//
//            self.pageTitleView=SGPageTitleView.init(frame:CGRect.init(x: CGFloat(0), y: CGFloat(NavHeight), width: screenWidth, height: self.TitleNewsH), delegate:self, titleNames: $0.compactMap({ $0.name }), configure: titleBtn)
//            self.pageTitleView?.backgroundColor = .clear
//            self.view.addSubview(self.pageTitleView!)
            //遍历数组
//            _=$0.compactMap({ (NewsTitleModel) -> ()in
//                switch NewsTitleModel.category{
//                case .video:
//                    let videoTable = THHomeVideoTableViewController()
//                    self.addChild(videoTable)
//
//                case .essayJoke:
//                    let essayJokevc = THHomeJokeViewControl()
//                    self.addChild(essayJokevc)
//                case .imagePPMM:
//                    let imagePPMM = THHomeJokeViewControl()
//                    self.addChild(imagePPMM)
//
//                case .imageFunny:
//                    let imagefunVC=THHomeJokeViewControl()
//                    self.addChild(imagefunVC)
//                case .photos:
//                    let homeImagevc = THHomeImageControol()
//                    self.addChild(homeImagevc)
//                case .jinritemai:
//                    let jinritemavc=THWebViewController()
//                    self.addChild(jinritemavc)
//                default :
//                    let homeVC=THHomeViewController()
//                    self.addChild(homeVC)
//                }
            
                //              //内容滑块
//                self.pageContentView=SGPageContentScrollView.init(frame: CGRect.init(x: 0.0, y: CGFloat(NavHeight)+self.TitleNewsH, width: screenWidth, height: screenHeight-CGFloat(NavHeight)-self.TitleNewsH-CGFloat(tabBarHeight)), parentVC: self, childVCs: self.children)
//                self.pageContentView?.delegatePageContentScrollView=self
//                self.view.addSubview(self.pageContentView!)
                self.view.addSubview(self.addButton)
                
            //})
        }
        
        
    }
    
    //MARK 导航的算法
    
    func clickAction() {
        //相机按钮点击
        self.navgateView.didSelectCameraButton={ sender in
        
            THPopView.popUpContentView(contentView: self.listtable, direct: .PopUpTop, onView: sender)
        }
        //搜索按钮
        self.navgateView.didSelectSearchButton={
            
        }
        // self.addButton.rx.
        
        
        
    }
    /***添加频道按钮**/
   @objc func addBtnClick() {
        
    }
    
   
    
    
}


extension THHomeViewController:JXSegmentedViewDelegate,JXSegmentedListContainerViewDataSource{
    //点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，而不关心具体是点击还是滚动选中的情况。
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        let player=THPlayerManager.sharedManager
        if player.isPlaying {
            player.pasuPlayingfromCellSuperview()
        }
        
        
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
    
    
    //返回列表的数量
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return self.segmentedDataSource.titles.count
    }
    //返回遵从`JXSegmentedListContainerViewListDelegate`协议的实例
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let model:THNewsTitleModel=self.titles?[index] as! THNewsTitleModel
        
    switch model.categoryType{
        case .video:
            let videoTable = THHomeVideoTableViewController()
            //添加子视图才能跳转
            self.addChild(videoTable)
            videoTable.newsTitle=model
            return videoTable as JXSegmentedListContainerViewListDelegate
            
        case .essayJoke:
            let essayJokevc = THHomeJokeViewControl()
            self.addChild(essayJokevc)
            essayJokevc.newsTitle=model
            return essayJokevc as JXSegmentedListContainerViewListDelegate
        case .imagePPMM:
            let imagePPMM = THHomeJokeViewControl()
            self.addChild(imagePPMM)
            imagePPMM.newsTitle=model
            return imagePPMM as JXSegmentedListContainerViewListDelegate
            
        case .imageFunny:
            let imagefunVC=THHomeJokeViewControl()
            self.addChild(imagefunVC)
            imagefunVC.newsTitle=model
            return imagefunVC as JXSegmentedListContainerViewListDelegate
        case .photos:
            let homeImagevc = THHomeImageControol()
            self.addChild(homeImagevc)
            homeImagevc.newsTitle=model
            return homeImagevc as JXSegmentedListContainerViewListDelegate
        case .jinritemai:
            let jinritemavc=THWebViewController()
            self.addChild(jinritemavc)
            return jinritemavc as JXSegmentedListContainerViewListDelegate
        default :
            let homeVC=THHomeTableViewVC()
            self.addChild(homeVC)
            homeVC.newsTitle=model
            return homeVC as JXSegmentedListContainerViewListDelegate
        }
       
        
        
        return THHomeTableViewVC() as JXSegmentedListContainerViewListDelegate
    }
    
}

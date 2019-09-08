//
//  THHomeTableViewVC.swift
//  TodayHeadline
//
//  Created by 宋海龙 on 2019/6/30.
//  Copyright © 2019 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class THHomeTableViewVC: THHomeBassTableViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
       tableView.register(THHomeCell.self, forCellReuseIdentifier: "THHomeCell")
       tableView.register(THTheyAlsoUseCell.self, forCellReuseIdentifier: "THTheyAlsoUseCell")
       tableView.register(THHomeUserCell.self, forCellReuseIdentifier: "THHomeUserCell")
    }
    
    
}

extension THHomeTableViewVC{
    
  override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadeArr.count
    }
    override  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = dadeArr[indexPath.row]
        print(model.cell_type)
        switch model.cell_type {
        case .none:
            return model.cellHeight 
            
        case .relatedConcern:
            return 290.0
        case .user:
            return model.UserCellH ?? 200
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model=dadeArr[indexPath.row]
        switch model.cell_type {
        case .none:
            let cell=tableView.dequeueReusableCell(withIdentifier:"THHomeCell", for:indexPath) as! THHomeCell
            cell.textmodel=model
            print("加载链接\(model.web_url)文章\(model.article_url)详情页\(model.display_url)网页\(model.url)详情\(model.description)")
            return cell
            
       
        case .user:
              let cell=tableView.dequeueReusableCell(withIdentifier:"THHomeUserCell", for:indexPath) as! THHomeUserCell
             cell.textModel=model
             return cell
        case .relatedConcern:
              let cell=tableView.dequeueReusableCell(withIdentifier:"THTheyAlsoUseCell", for:indexPath) as! THTheyAlsoUseCell
              cell.smallVieo=model.raw_data
             return cell
        }
        
        
      
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model=dadeArr[indexPath.row]
        print("nkvdnvklnslkn\(model.web_url)nksldns\(model.article_url)详情页\(model.display_url)")
        if newsTitle.categoryType == .questionAndAnswer{
            //跳转问答
            let  defailVC=THWenDaViewController()
               defailVC.qid=model.item_id
               defailVC.enterForm = .clickHeadline
            navigationController?.pushViewController(defailVC, animated: true)
        }else{
            //还得添加视频
            switch model.cell_type {
            case .none:
                if model.has_video{
                    let videoDetailVC = THVideoDetailViewController()
                    videoDetailVC.video = model
                    videoDetailVC.delegate = self
                    //videoDetailVC.currentTime = currentTime
                    videoDetailVC.currentIndexPath = indexPath
                    //右面图片的设置
                    if let image = model.image_list.first {
                        thPlayer.playerLayer?.placeholderView.isHidden=false
                        thPlayer.playerLayer?.placeholderView.sd_setImage(with: URL.init(string: image.urlString), completed: nil)
                        
                        
                        
                        
                    } else if model.middle_image.url.length > 0 {
                       thPlayer.playerLayer?.placeholderView.isHidden=false
                        thPlayer.playerLayer?.placeholderView.sd_setImage(with: URL.init(string: model.middle_image.urlString), completed: nil)
                        
                    } else if let largeImage = model.large_image_list.first {
                         thPlayer.playerLayer?.placeholderView.isHidden=false
                         thPlayer.playerLayer?.placeholderView.sd_setImage(with: URL.init(string: largeImage.urlString), completed: nil)
                        
                        
                    }
                    videoDetailVC.player=self.thPlayer
                    videoDetailVC.isPlayer=false
                    THHomeVM.parseVideoRealURL(video_id: model.video_detail_info.video_id, completionHandler:{  (readVideo) in
                        videoDetailVC.realVideo=readVideo
                    self.navigationController?.pushViewController(videoDetailVC, animated: true)
                        
                    })
                    
                    
                
                }else{
                    let  defailVC=THDefailWebViewController()
                   
                        defailVC.webUrl=model.display_url
                  
               
                  
                    
                    //defailVC.webUrl=model.article_url
                    navigationController?.pushViewController(defailVC, animated: true)
                }
              //用户
            case .user:
                let  defailVC=THUserVC()
                navigationController?.pushViewController(defailVC, animated: true)
        //用户详情
            case .relatedConcern:

                let  defailVC=THUserMesseageViewController()
                navigationController?.pushViewController(defailVC, animated: true)
            }
        }
    }
    
    
    
    
    
    
}
// MARK: - VideoDetailViewControllerDelegate
extension THHomeTableViewVC: VideoDetailViewControllerDelegate {
    /// 详情控制器将要消失
    func VideoDetailViewControllerViewWillDisappear(_ realVideo: RealVideo, _ currentTime: TimeInterval, _ currentIndexPath: IndexPath) {
        //        let currentCell = tableView.cellForRow(at: currentIndexPath) as! THVideoViewCell
        //        currentCell.bgImageButton.addSubview(player)
        //        player.snp.makeConstraints({ $0.edges.equalTo(currentCell.bgImageButton) })
        //        // 设置视频播放地址
        //        player.setVideo(resource: BMPlayerResource(url: URL(string: realVideo.video_list.video_1.mainURL)!))
        //        // 设置当前播放时间
        //        player.seek(currentTime)
        //        // 视频播放时隐藏 cell 的部分子视图
        //       // currentCell.hideSubviews()
        //        self.priorCell = currentCell
    }
}

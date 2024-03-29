//
//  HomeImageCell.swift
//  News
//
//  Created by 杨蒙 on 2018/2/6.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class HomeImageCell: UICollectionViewCell, RegisterCellFromNib {

    var image = ImageList() {
        didSet {
            //imageView.kf.setImage(with: URL(string: image.urlString)!)
            //imageView.sd_setImage(with: URL(string: image.urlString)!, completed: nil)
            imageView.sd_setImage(with: URL(string: image.urlString)!, placeholderImage: UIImage.init(named: "details_slogan01"),completed: nil)
            
            
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}

//
//  showImageView.swift
//  Project
//
//  Created by Ahmed Elmemy on 12/07/2022.
//

import UIKit
import Kingfisher
import SkeletonView

class showImageView{
    
    static func showImage(imageView:UIImageView,url:String){
        let url = URL(string: url)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        imageView.showAnimatedSkeleton()
        //        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1))
            ],
            progressBlock: { receivedSize, totalSize in
                // Progress updated
            },
            completionHandler: { result in
                // Done
                imageView.hideSkeleton()
                
            }
        )
        
        
        
    }
    
}


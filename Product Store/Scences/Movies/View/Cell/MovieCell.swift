//
//  MovieCell.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import UIKit
import SkeletonView

class MovieCell: UITableViewCell,MovieCellView {
       
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static var MovieCellIdentifer = "MovieCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        showAnimatedSkeleton()
    }
    
    
    func hideViewSkeleton(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.hideSkeleton()
        }
    }
    
    
  
    
    func configCell(movieModel: Movie) {
        showImageView.showImage(imageView: movieImage, url: movieModel.largeCoverImage ?? "")
        titleLabel.text = movieModel.titleEnglish
    }
    
    
    
 
    
    
    
}

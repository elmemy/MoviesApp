//
//  MovieDetailsViewController.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import UIKit
import SkeletonView
import Cosmos

final class MovieDetailsViewController: UIViewController {
    
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var ratingView: CosmosView!
    @IBOutlet var detailsTextView: UITextView!
    
    var presenter: MovieDetailsPresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        hadelNavigationBarView()
    }
    
  
    
}



extension MovieDetailsViewController: MovieDetailsView {
    func displayRating(rating: Double) {
        ratingView.rating = rating
    }
    
    func displayImage(image: String) {
        showImageView.showImage(imageView: movieImageView, url: image)
    }
    
    func displayTitle(title: String) {
        self.title = title
    }
    
    func displayDesc(desc: String) {
        self.detailsTextView.text = desc
    }
}

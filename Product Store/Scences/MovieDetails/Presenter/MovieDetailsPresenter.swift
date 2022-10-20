//
//  MovieDetailsPresenter.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import Foundation

protocol MovieDetailsView: AnyObject {
    func displayImage(image:String)
    func displayTitle(title:String)
    func displayDesc(desc:String)
    func displayRating(rating:Double)
}

protocol MovieDetailsPresenter {
    func viewDidLoad()
}

class MovieDetailsPresenterImplementation: MovieDetailsPresenter {
    fileprivate weak var view: MovieDetailsView?
    internal let router: MovieDetailsRouter
    
    var movieModel:Movie
    
    init(view: MovieDetailsView,router: MovieDetailsRouter, movieModel:Movie) {
        self.view = view
        self.router = router
        self.movieModel = movieModel
    }
    
    
    func viewDidLoad() {
        self.view?.displayTitle(title: movieModel.titleEnglish ?? "")
        self.view?.displayImage(image: movieModel.largeCoverImage ?? "")
        self.view?.displayDesc(desc: movieModel.descriptionFull ?? "")
        self.view?.displayRating(rating: movieModel.rating ?? 0.0)
    }
    
    
}

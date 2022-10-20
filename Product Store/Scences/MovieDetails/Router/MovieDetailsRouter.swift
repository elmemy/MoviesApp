//
//  MovieDetailsRouter.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import UIKit


protocol MovieDetailsRouter {
  
}

class MovieDetailsRouterImplementation: MovieDetailsRouter {
    fileprivate weak var MovieDetailsViewController: MovieDetailsViewController?
    
    init(MovieDetailsViewController: MovieDetailsViewController) {
        self.MovieDetailsViewController = MovieDetailsViewController
    }
    
    
}

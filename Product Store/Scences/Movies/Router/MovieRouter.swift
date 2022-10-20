//
//  MovieRouter.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import UIKit


protocol MovieRouter {
    func goToMovieDetails(movieModel:Movie) 
}

class MovieRouterImplementation: MovieRouter {
    fileprivate weak var MovieViewController: MovieViewController?
    
    init(MovieViewController: MovieViewController) {
        self.MovieViewController = MovieViewController
    }
    
    
    
    func goToMovieDetails(movieModel:Movie) {
        let configurator = MovieDetailsConfiguratorImplementation()
        let vc = Storyboard.Main.instantiate(MovieDetailsViewController.self)
        configurator.configure(MovieDetailsViewController: vc, movieModel: movieModel)
        self.MovieViewController?.show(vc, sender: self)
    }
    
    
}

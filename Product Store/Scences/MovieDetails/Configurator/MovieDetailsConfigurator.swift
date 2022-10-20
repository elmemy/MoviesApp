//
//  MovieDetailsConfigurator.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import Foundation


protocol MovieDetailsConfigurator {
    func configure(MovieDetailsViewController:MovieDetailsViewController)
}


class MovieDetailsConfiguratorImplementation {

    func configure(MovieDetailsViewController:MovieDetailsViewController,movieModel:Movie) {
        let view = MovieDetailsViewController
        let router = MovieDetailsRouterImplementation(MovieDetailsViewController: view)
        let presenter = MovieDetailsPresenterImplementation(view: view, router: router,movieModel: movieModel)
        
        
        MovieDetailsViewController.presenter = presenter
    }
    
}

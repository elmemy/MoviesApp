//
//  MovieInteractor.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import Foundation

protocol MoviesInteractorProtocol{
    func getData(page:Int,completionHandler: @escaping (MoviesModel?, Error?) -> ())
}


class MovieInteractor:MoviesInteractorProtocol {
    
     func getData(page:Int,completionHandler: @escaping (MoviesModel?, Error?) -> ()) {

         var itemResponse: CallResponse<MoviesModel> {
             return {(response) in
                 switch response {
                 case .failure(let error):
                     completionHandler(nil, error)
                 case .success(let movies):
                     completionHandler(movies, nil)
                 }
             }
         }
       
             // creating request with the builder enum
    
         APIRouter.Movies(page:page).send(MoviesModel.self, then: itemResponse)
     }
 }

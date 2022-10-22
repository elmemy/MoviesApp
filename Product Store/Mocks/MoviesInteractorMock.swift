//
//  MoviesInteractorMocks.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 22/10/2022.
//

import Foundation

class MoviesInteractorMock:MoviesInteractorProtocol{
    
    
    var failFetchingData:Bool
    var returnedModel: MoviesModel?
    
    init(failFetchingData: Bool, returnedModel: MoviesModel?) {
        self.failFetchingData = failFetchingData
        self.returnedModel = returnedModel
    }
    
    func getData(page: Int, completionHandler: @escaping (MoviesModel?, Error?) -> ()) {
        
        
        
        if !failFetchingData{
            completionHandler(returnedModel,nil)
        }else{
            completionHandler(nil,MoviesInteractorMockedError.defualt)
        }
        
    }
    
    
    enum MoviesInteractorMockedError: Error{
        case defualt
    }
    
    
}

//
//  UserRequest.swift
//  Project
//
//  Created by Ahmed Elmemy on 10/07/2022.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestBuilder,APIRequestHandler {
    
    
    case Movies(page:Int)
  
    // MARK: - Path
    internal var path: String {
        switch self {
        case .Movies:
            return "list_movies.json"
        }
        
    }
    
    
    // MARK: - Parameters
    internal var parameters: Parameters {
        var params = Parameters.init()
        switch self {
        case .Movies(let page):
            params["page"] = page

      
         
        default:
            break
        }
        
        
        return params
        
        
    }
    
    
    
    
    // MARK: - Methods
    internal var method: HTTPMethod {
        switch self {
//        case .login:
//            return .post
            
        default:
            return .get
            
       
        
        }
        
    }
    
    
    
    
    
}

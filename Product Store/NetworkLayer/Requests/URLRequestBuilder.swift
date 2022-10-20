//
//  URLRequestBuilder.swift
//  Project
//
//  Created by Ahmed Elmemy on 10/07/2022.
//

import Foundation
import Alamofire
import Localize_Swift

protocol URLRequestBuilder: URLRequestConvertible {
    
    var mainURL: URL { get }
    var requestURL: URL { get }
    // MARK: - Path
    var path: String { get }
    
    // MARK: - Parameters
    var parameters: Parameters { get }
    var headers:HTTPHeaders {get}
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
}


extension URLRequestBuilder {
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var mainURL: URL  {
        return URL(string: ("\(URLs.BASE)"))!
    }
    
    var requestURL: URL {
        return mainURL.appendingPathComponent(path)
    }
    
    var headers:HTTPHeaders{
        var headers = HTTPHeaders()
//        headers["Lang"] = Localize.currentLanguage()
        print(Localize.currentLanguage())
        return headers
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { header in
            request.addValue(header.value, forHTTPHeaderField: header.name)
        }
        return request
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}

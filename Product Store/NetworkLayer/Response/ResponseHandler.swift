//
//  ResponseHandler.swift
//  Project
//
//  Created by Ahmed Elmemy on 10/07/2022.
//

import Foundation
import Alamofire

protocol HandleAlamoResponse {
    /// Handles request response, never called anywhere but APIRequestHandler
    ///
    /// - Parameters:
    ///   - response: response from network request, for now alamofire Data response
    ///   - completion: completing processing the json response, and delivering it in the completion handler
    func handleResponse<T: CodableInit>(_ response: AFDataResponse<Data>, completion: CallResponse<T>)
}

extension HandleAlamoResponse {
    
    func handleResponse<T: CodableInit>(_ response: AFDataResponse<Data>, completion: CallResponse<T>) {
        switch response.result {
        case .failure(let error):
            completion?(.failure(error))
        case .success(let value):
            do {
                let modules = try T(data: value)
                completion?(.success(modules))
            } catch {
                completion?(.failure(error))
            }
        }
    }
    
}


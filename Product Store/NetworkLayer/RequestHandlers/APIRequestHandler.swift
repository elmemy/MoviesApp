//
//  APIRequestHandler.swift
//  Project
//
//  Created by Ahmed Elmemy on 10/07/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

/// Response completion handler beautified.
typealias CallResponse<T> = ((Result<T, Error>) -> Void)?


/// API protocol, The alamofire wrapper
protocol APIRequestHandler: HandleAlamoResponse { }

extension APIRequestHandler where Self: URLRequestBuilder {
    
    func send<T: CodableInit>(_ decoder: T.Type, data: [UploadData]? = nil, progress: ((Progress) -> Void)? = nil, then: CallResponse<T>) {
        if Connectivity.isConnectedToInternet() == true{
            
            if let data = data {
                uploadToServerWith(decoder, data: data, request: self, parameters: self.parameters, progress: progress, then: then)
                
            }else{
                AF.request(self).validate().responseData {(response) in
                    self.handleResponse(response, completion: then)
                }.responseJSON { (response) in
                    // handle debug
                    
                    print(response.value as Any)
                    let json = JSON(response.data)
                    
                    
                }
            }
            
        }else{
            NotificationCenter.default.post(name: Notification.Name.noIntrnet, object: nil)
        }
    }
    
    func cancelRequest() -> Void {
        let sessionManager = Session.default
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
            uploadTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
            downloadTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
        }
    }
}


extension APIRequestHandler {
    
    private func uploadToServerWith<T: CodableInit>(_ decoder: T.Type, data: [UploadData], request: URLRequestConvertible, parameters: Parameters?, progress: ((Progress) -> Void)?, then: CallResponse<T>) {
        if Connectivity.isConnectedToInternet() == true{
            AF.upload(multipartFormData: { mul in
                for d in data{
                    mul.append(d.data, withName: d.name, fileName: d.fileName, mimeType: d.mimeType)
                }
                guard let parameters = parameters else { return }
                for (key, value) in parameters {
                    mul.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                }
            }, with: request).responseData { results in
                self.handleResponse(results, completion: then)
            }.responseString { string in
                debugPrint(string.value as Any)
                
                let json = JSON(string.data)
                
            }
        }else{
            NotificationCenter.default.post(name: Notification.Name.noIntrnet, object: nil)
        }
    }
}






extension Notification.Name {
    static let noIntrnet = Notification.Name("noIntrnet")
}

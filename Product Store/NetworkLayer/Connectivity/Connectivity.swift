//
//  Connectivity.swift
//  Project
//
//  Created by Ahmed Elmemy on 10/07/2022.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

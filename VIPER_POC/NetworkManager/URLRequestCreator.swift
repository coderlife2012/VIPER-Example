//
//  URLRequestCreator.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import Foundation

class URLRequestCreator {
    
    class func createRequestWith(_ url: String, method: String? = "GET", body:[String: Any]? = nil, headers: [String: String]? = nil) -> URLRequest? {
        
        guard let dataURL = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}

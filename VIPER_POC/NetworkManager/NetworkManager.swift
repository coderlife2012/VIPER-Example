//
//  NetworkManager.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    init(){}    
    //APPError enum which shows all possible errors
    enum APPError: Error {
        case networkError(Error)
        case dataNotFound
        case jsonParsingError(Error)
        case invalidStatusCode(Int)
    }

    //Result enum to show success or failure
    enum Result<T> {
        case success(T)
        case failure(APPError)
    }

    //dataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest<T: Decodable>(with request: URLRequest, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {

        //create the session object
        let session = URLSession.shared
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                completion(Result.failure(APPError.networkError(error!)))
                return
            }

            guard let data = data else {
                completion(Result.failure(APPError.dataNotFound))
                return
            }

            do {
                //create decodable object from data
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
            }
        })

        task.resume()
    }
}

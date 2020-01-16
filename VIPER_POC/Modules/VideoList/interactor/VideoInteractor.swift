//
//  VideoInteractor.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import UIKit

class VideoInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
         func fetchVideos() {
        if let request = URLRequestCreator.createRequestWith(API_VIDEO_LIST) {
            NetworkManager.sharedInstance.dataRequest(with: request, objectType: Movie.self) { (result: NetworkManager.Result) in
                switch result {
                case .success(let object):
                    //print(object)
                    self.presenter?.videoFetchedSuccess(videoList: object.movie_list)
                case .failure(let error):
                    print(error)
                    self.presenter?.videoFetchFailed()
                }
            }
        }
    
    }
    
    
}


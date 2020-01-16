//
//  VideoPresenter.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import UIKit
import Foundation

class VideoPresenter:ViewToPresenterProtocol{
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingVideoList() {
        interactor?.fetchVideos()
    }
    func showDetailController(navigationController: UINavigationController,video: VideoList?) {
         router?.pushToDetailScreen(navigationConroller: navigationController,video: video)
    }
    
    
}

extension VideoPresenter:InteractorToPresenterProtocol{
    
    func videoFetchedSuccess(videoList: Array<VideoList>) {
        view?.showVideoList(videoArray: videoList)
    }
    func videoFetchFailed() {
        view?.showError(error: "Error: failed to fetch api response")
    }
    
}


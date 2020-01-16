//
//  VideoProtocol.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import Foundation
import UIKit


protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingVideoList()
    func showDetailController(navigationController:UINavigationController,video: VideoList?)
}

protocol PresenterToViewProtocol: class{
    func showVideoList(videoArray:Array<VideoList>)
    func showError(error:String)
}
protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchVideos()
}
protocol InteractorToPresenterProtocol: class {
    func videoFetchedSuccess(videoList  :Array<VideoList>)
    func videoFetchFailed()
}
protocol PresenterToRouterProtocol: class {
    static func createVideoModule()-> VideoViewController
    func pushToDetailScreen(navigationConroller:UINavigationController,video: VideoList?)
}

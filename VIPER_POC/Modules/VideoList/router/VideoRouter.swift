//
//  VideoRouter.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import Foundation
import UIKit

class VideoRouter:PresenterToRouterProtocol {
    static func createVideoModule() -> VideoViewController {
        
        let view = VideoRouter.mainstoryboard.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = VideoPresenter()
        let interactor: PresenterToInteractorProtocol = VideoInteractor()
        let router:PresenterToRouterProtocol = VideoRouter()
        
        view.videoPresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    func pushToDetailScreen(navigationConroller: UINavigationController,video: VideoList?) {
        let videoDetail = VideoDetailRouter.createVideoDetailModule()
        videoDetail.video = video
        navigationConroller.pushViewController(videoDetail,animated: true)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}

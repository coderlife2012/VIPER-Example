//
//  VideoDetailRouter.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import Foundation
import UIKit

class VideoDetailRouter {
    
    static func createVideoDetailModule() -> VideoDetailViewController {
        
        let view = VideoDetailRouter.mainstoryboard.instantiateViewController(withIdentifier: "VideoDetailViewController") as! VideoDetailViewController

        return view
        
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}

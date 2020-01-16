//
//  VideoDetailViewController.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import UIKit
import Alamofire

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var mImageView: UIImageView!
    var video: VideoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Video Detail"
        
        // Do any additional setup after loading the view.
        if let imageUrl = video?.image_url {
            Alamofire.request(imageUrl).responseData { [weak self](response) in
                if response.error == nil {
                    if let data = response.data {
                        DispatchQueue.main.async {
                            self?.mImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

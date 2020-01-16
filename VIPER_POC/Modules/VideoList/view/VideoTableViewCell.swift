//
//  VideoTableViewCell.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import UIKit
import Alamofire

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func showVideoData(object: Any?) {
        guard let video = object as? VideoList else {
            return
        }
        
        
        mTitle.text = video.title
        mDescription.text = video.brief
        
        if let imageUrl = video.image_url {
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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

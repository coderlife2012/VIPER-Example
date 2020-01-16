//
//  VideoListModel.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import Foundation

// MARK: - Video List
struct VideoList: Codable {
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var image_url:String?
    
    //    enum CodingKeys: String, CodingKey {
    //        case id = "_id"
    //        case title, brief, filesource
    //    }
    
}

struct Movie: Codable {
    var success: Bool = false
    var movie_list: [VideoList] = []
    
    enum CodingKeys : String,CodingKey {
        case success
        case movie_list
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.movie_list = try container.decode([VideoList].self, forKey: .movie_list)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.movie_list, forKey: .movie_list)
    }
}

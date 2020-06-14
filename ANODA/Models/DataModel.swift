//
//  Post.swift
//  ANODA
//
//  Created by mac on 13.06.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import Foundation

struct NewsFeedData: Codable {
    let postDataArray : [PostData]
    
    init(data: [String: Any]) {
        self.postDataArray = data["news_feed"] as! [PostData]
    }
}

struct PostData: Codable {
    
    let profile_image: String?
    let user_name: String?
    let place_name: String?
    let post_image: String?
    let liked_nickname: [String?]
    let comment: String?
    let post_time: String?
    
    init?(data: [String: Any])  {
        guard
            let profile_image = data["profile_image"] as? String,
            let user_name = data["user_name"] as? String,
            let place_name = data["place_name"] as? String,
            let post_image = data["post_image"] as? String,
            let liked_nickname = data["liked_nickname"] as? [String],
            let comment = data["comment"] as? String,
            let post_time = data["post_time"] as? String
    
            else { return nil }
        
        self.profile_image = profile_image
        self.user_name = user_name
        self.place_name = place_name
        self.post_image = post_image
        self.liked_nickname = liked_nickname
        self.comment = comment
        self.post_time = post_time
    }
}

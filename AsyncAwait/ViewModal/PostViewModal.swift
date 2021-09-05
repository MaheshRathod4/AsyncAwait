//
//  PostViewModal.swift
//  PostViewModal
//
//  Created by Mahesh Rathod on 05/09/21.
//

import Foundation

class PostViewModal: PostService {
    
    var posts = [Post]()
    var apiRequest:APIRequest
    
    init(apiRequest:APIRequest = APIService()) {
        self.apiRequest = apiRequest
    }
    
    func requestPosts() async  {
        let responsePost = try? await fetchPost()
        self.posts = responsePost?.0 ?? []
    }

    
}

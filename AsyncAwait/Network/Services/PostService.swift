//
//  PostService.swift
//  PostService
//
//  Created by Mahesh Rathod on 05/09/21.
//

import Foundation

protocol PostService {
    var apiRequest: APIRequest { get }
    func fetchPost() async throws -> ([Post]?,CustomError?)
}

extension PostService {
    func fetchPost() async throws -> ([Post]?,CustomError?) {
        return try await apiRequest.request(with: EndPoints.getPosts)
    }
}

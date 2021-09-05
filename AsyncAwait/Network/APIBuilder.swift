//
//  APIBuilder.swift
//  APIBuilder
//
//  Created by Mahesh Rathod on 05/09/21.
//

import Foundation


enum EndPoints {
    case getPosts
}

extension EndPoints : RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .getPosts:
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
            else { preconditionFailure("Invalid URL format") }
            let request = URLRequest(url: url)
            return request
        }
    }
}

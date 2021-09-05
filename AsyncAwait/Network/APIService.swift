//
//  APIServices.swift
//  APIServices
//
//  Created by Mahesh Rathod on 05/09/21.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}

protocol APIRequest {
    func request<T: Decodable>(with builder: RequestBuilder) async throws -> (T?,CustomError?)
}

struct APIService : APIRequest {
    func request<T>(with builder: RequestBuilder) async throws -> (T?, CustomError?) where T : Decodable {
        let (data,response) = try await URLSession.shared.data(for:builder.urlRequest)
        if let response = response as? HTTPURLResponse {
            if (200...299).contains(response.statusCode) {
                let result = try JSONDecoder().decode(T.self, from: data)
                return (result,nil)
            } else {
                return (nil,CustomError.httpError(response.statusCode))
            }
        } else {
            return (nil,CustomError.unknown)
        }
    }
}

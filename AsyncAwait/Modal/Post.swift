//
//  Post.swift
//  Post
//
//  Created by Mahesh Rathod on 28/08/21.
//

import Foundation

struct Post : Decodable {
    var userId, id: Int
    var title, body: String

}

//
//  EnumHelper.swift
//  EnumHelper
//
//  Created by Mahesh Rathod on 05/09/21.
//

import Foundation

enum CustomError : Error {
    case jsonDataParseError
    case httpError(Int)
    case unknown
}

enum RequestType : String {
    case post = "POST"
    case get = "GET"
}

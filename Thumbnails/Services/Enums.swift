//
//  Enums.swift
//  Movies
//
//  Created by 13216146 on 30/01/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}
enum GenericError: Error {
    case invalidURL
    case invalidResponse
    case noError

}

enum StatusCode {
    case success
    case notFound
    case serverNotAvailable

    var value: Int {
        switch self {
        case .success:
            return 200
        case .serverNotAvailable:
            return 500
        case .notFound:
            return 404
        }
    }
}

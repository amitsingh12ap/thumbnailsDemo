//
//  Service.swift
//  Movies
//
//  Created by 13216146 on 30/01/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import Foundation

typealias handler = (Result<Any>) -> Void
protocol Service {
    var endPoint: String {get}
    func executeApi(onCompletion: @escaping handler)
}

extension Service {
    func executeApi(onCompletion: @escaping handler) {
        guard let url = URL(string: endPoint) else {
            onCompletion(.failure(GenericError.invalidURL))
            return
        }
        var request = URLRequest.init(url: url)
        request.httpMethod = "GET"
        /* Only for Rapid api */
        let headers = [
            "x-rapidapi-host": "currency-converter5.p.rapidapi.com",
            "x-rapidapi-key": "70612cb596msh2412c74e1e2f567p1abf13jsn08e0d0f787a1"
        ]
        request.allHTTPHeaderFields = headers
        let session = URLSession.init(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == StatusCode.success.value {
                    onCompletion(.success(data as Any))
                } else {
                    onCompletion(.failure(GenericError.invalidURL))
                }
            } else {
                if let apiError = error {
                    onCompletion(.failure(apiError))
                } else {
                    onCompletion(.failure(GenericError.invalidURL))
                }
            }
        }
        dataTask.resume()
    }
    
    func parse<T:Codable>(model: T.Type, data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(T.self, from: data)
    }
}

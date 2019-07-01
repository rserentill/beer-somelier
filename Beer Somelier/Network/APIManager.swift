//
//  APIManager.swift
//  Beer Somelier
//
//  Created by Roger Serentill Gené on 27/06/2019.
//  Copyright © 2019 Fidety. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

class APIManager {
    
    static let baseUrl = "https://api.punkapi.com/v2"
    //(Swift.Result<Response, MoyaError>) -> Void
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    public enum RequestError: Error {
        case connection // No internet
        case notFound // 404
        case badRequest // 4xx
        case internalServer // 5xx
        case parse(String)
        case unknown
    }
    
    static func request(url: String,
                        method: HTTPMethod,
                        parameters: [String: String] = [:],
                        completion: @escaping (Result<JSON, RequestError>)->Void) {
        
        guard var components = URLComponents(string: baseUrl + url) else { return }
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        var request = URLRequest(url: components.url!)
        
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        request.httpMethod = method.rawValue
        
        // Perform request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.connection))
            }
            else {
                
                guard let data = data, let response = response as? HTTPURLResponse else { completion(.failure(.unknown)); return }
                
                do {
                    let responseJson = try JSON(data: data)
                    
                    switch response.statusCode {
                    case 200:
                        completion(.success(responseJson))
                    case 400...499:
                        completion(.failure( response.statusCode == 404 ? .notFound : .badRequest ))
                    case 500...599:
                        completion(.failure(.internalServer))
                    default:
                        completion(.failure(.unknown))
                        break
                    }
                }
                catch {
                    completion(.failure(.parse(error.localizedDescription)))
                }
            }
            }.resume()
    }
}

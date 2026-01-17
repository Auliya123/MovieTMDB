//
//  NetworkRequest.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import Foundation

extension URLRequest {
    init(endPoint: Endpoint) throws {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Constants.baseURL
        components.path = Constants.apiPathPrefix + endPoint.path

        guard let url = components.url else { throw APIRequestError.badRequest(message: "Invalid URL") }

        self.init(url: url, timeoutInterval: endPoint.timeoutInterval)

        self.httpMethod = endPoint.method.rawValue

        HTTPHeaders.defaultHeaders().forEach { key, value in
            setValue(value, forHTTPHeaderField: key)
        }

        endPoint.headers?.forEach { key, value in
            setValue(value, forHTTPHeaderField: key)
        }


        let authorization = "Bearer \(AppConfig.tmdbAPIKey)"
        self.setValue(authorization, forHTTPHeaderField: "Authorization")


        switch endPoint.task {
        case .requestPlain:
            self.setValue("0", forHTTPHeaderField: "Content-Length")
        case .requestURLParameters(let parameters):
            var queryItems = [URLQueryItem]()
            parameters.forEach { queryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))}
            components.queryItems = queryItems
            self.url = components.url
        case .requestJSONEncodable(let jsonEncodable):
            let encoder = JSONEncoder()
            do {
                self.httpBody = try encoder.encode(jsonEncodable)
            } catch {
                throw APIRequestError.encodingError(message: error.localizedDescription)
            }

        }
    }
}

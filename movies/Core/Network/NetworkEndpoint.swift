//
//  NetworkEndpoint.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import UIKit

enum HTTPMethod: String {
    case get = "GET"
}

enum AuthorizationType {
    case anonymous
    case authorized
}

enum HTTPTask{
    case requestPlain
    case requestURLParameters(_ parameters:[String: Any])
    case requestJSONEncodable(_ body: Encodable)
}

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: [String: String]? { get }
    var authorizationType: AuthorizationType { get }
    var timeoutInterval: Double { get }
}

extension Endpoint {
    var baseURL: String {
        return Constants.baseURL
    }

    var headers: [String: String]?{
        HTTPHeaders.defaultHeaders()
    }

    var authorizationType: AuthorizationType {
       return .anonymous
    }

    var timeoutInterval: Double {
        return 10
    }
}

//
//  APIRequestError.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import Foundation

public enum APIRequestError: Error {
    case badRequest(message: String)
    case apiError(code: Int, message: String)
    case decodingError(message: String)
    case encodingError(message: String)
    case invalidResponse(message: String)
    case internetError

    var localizedDescription: String {
        switch self {
        case .badRequest( let message),
                .apiError( _, let message),
                .decodingError(let message),
                .encodingError(let message),
                .invalidResponse(let message):
            return message
        case .internetError:
            return "Internet connection is required"
        }
    }

    var titleDescription: String {
        return "Error"
    }


}

struct NetworkHandle: Codable{
    let code: Int?
    let body: NetworkHandleBody
}

struct NetworkHandleBody: Codable {
    let message: String?
}

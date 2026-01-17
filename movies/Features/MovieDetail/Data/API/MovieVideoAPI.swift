//
//  MovieVideoAPI.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

enum MovieVideoAPI {
    case getMovieVideo(id: Int)
}

extension MovieVideoAPI: Endpoint {
    var path: String {
        switch self {
        case.getMovieVideo(let id):
            return "movie/\(id)/videos"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getMovieVideo:
            return .requestPlain
        }
    }

    var authorizationType: AuthorizationType {
        return .anonymous
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }

    var timeoutInterval: Double {
        return 30.0
    }
}

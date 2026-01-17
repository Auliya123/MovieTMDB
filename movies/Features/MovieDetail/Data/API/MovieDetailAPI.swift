//
//  MovieDetailAPI.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

enum MovieDetailAPI {
    case getMovieDetail(id: Int)
}

extension MovieDetailAPI: Endpoint {
    var path: String {
        switch self {
        case.getMovieDetail(let id):
            return "movie/\(id)"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getMovieDetail:
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

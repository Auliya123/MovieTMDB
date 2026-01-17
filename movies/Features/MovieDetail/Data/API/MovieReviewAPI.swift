//
//  MovieReviewAPI.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

enum MovieReviewAPI {
    case getMovieReviews(id: Int)
}

extension MovieReviewAPI: Endpoint {
    var path: String {
        switch self {
        case.getMovieReviews(let id):
            return "movie/\(id)/reviews"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getMovieReviews:
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

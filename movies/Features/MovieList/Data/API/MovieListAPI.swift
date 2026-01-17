//
//  MovieListAPI.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

enum MovieListAPI {
    case getMovieList(page: Int)
}

extension MovieListAPI: Endpoint{
    var path: String {
        return "movie/popular"
    }

    var method: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getMovieList(let page):
            return .requestURLParameters([
                "language": "en-US",
                "page": page
            ])
        }
    }
}

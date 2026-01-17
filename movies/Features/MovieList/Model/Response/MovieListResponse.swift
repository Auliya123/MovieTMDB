//
//  MovieListResponse.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import Foundation

struct MovieListResponse: Codable{
    let page: Int
    let results: [Movie]
}

struct Movie: Identifiable, Codable{
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String?
    var voteAverage: Double
    var posterUrl: URL? {
        guard let posterPath else {return nil}

        return URL(string: Constants.imageBaseURL + posterPath)
    }
}

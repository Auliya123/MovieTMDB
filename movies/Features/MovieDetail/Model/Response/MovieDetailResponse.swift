//
//  MovieDetailResponse.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

import Foundation

struct MovieDetailResponse: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let backdropPath: String?
    let posterPath: String?
    let runtime: Int?
    var runtimeText: String? {
        guard let runtime else {return nil}
        return runtime.hoursAndMinutes
    }
    var backdropURL: URL? {
        guard let backdropPath else {return nil}
        return URL(string: Constants.imageBaseURL + backdropPath)
    }
    var posterURL: URL? {
        guard let posterPath else {return nil}
        return URL(string: Constants.imageBaseURL + posterPath)
    }
}

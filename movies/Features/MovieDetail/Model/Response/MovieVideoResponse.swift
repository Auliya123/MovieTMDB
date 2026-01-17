//
//  MovieVideoResponse.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

import Foundation

struct MovieVideoResponse: Codable{
    let id: Int
    let results: [MovieVideo]
}

struct MovieVideo: Identifiable, Codable{
    let id: String
    let site: String
    let key: String?
    let type: String?
    var trailerURL: URL? {
        guard let key else {return nil}
        guard site == "YouTube" else {return nil}

        return URL(string: Constants.youtubeURL + key)
    }
}

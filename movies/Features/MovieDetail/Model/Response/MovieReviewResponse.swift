//
//  MovieReviewResponse.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

import Foundation

struct MovieReviewResponse: Codable{
    let id: Int
    let results: [MovieReview]
}

struct MovieReview: Identifiable, Codable{
    let id: String
    let author: String
    let content: String
    let authorDetails: AuthorDetails?
    let createdAt: String
    var createdAtText: String? {
        return DateFormatter.displayString(fromISO8601: createdAt)
    }
}

struct AuthorDetails: Codable {
    var avatarPath: String?
    var rating: Int?
    var avatarURL: URL?{
        guard let avatarPath else {return nil}
        return URL(string: Constants.imageBaseURL + avatarPath)
    }
    var ratingPercent: String?{
        if let rating = rating{
            return "\(rating * 10)%"
        }
        return nil
    }
}

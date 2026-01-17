//
//  MovieReviewService.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

protocol MovieReviewServiceProtocol {
    func fetchMovieReviews(id: Int) async throws -> MovieReviewResponse
}

final class MovieReviewService: MovieReviewServiceProtocol{
    private let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }

    func fetchMovieReviews(id: Int) async throws -> MovieReviewResponse {
        let endpoint = MovieReviewAPI.getMovieReviews(id: id)
        return try await networker.requestAsync(type: MovieReviewResponse.self, endPoint: endpoint)
    }
}

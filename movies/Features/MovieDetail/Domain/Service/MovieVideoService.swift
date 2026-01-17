//
//  MovieVideoService.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

protocol MovieVideoServiceProtocol {
    func fetchMovieVideo(id: Int) async throws -> MovieVideoResponse
}

final class MovieVideoService: MovieVideoServiceProtocol{
    private let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }

    func fetchMovieVideo(id: Int) async throws -> MovieVideoResponse {
        let endpoint = MovieVideoAPI.getMovieVideo(id: id)
        return try await networker.requestAsync(type: MovieVideoResponse.self, endPoint: endpoint)
    }
}

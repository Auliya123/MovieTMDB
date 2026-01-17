//
//  MovieDetailService.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

protocol MovieDetailServiceProtocol {
    func fetchMovieDetail(id: Int) async throws -> MovieDetailResponse
}

final class MovieDetailService: MovieDetailServiceProtocol{
    private let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }

    func fetchMovieDetail(id: Int) async throws -> MovieDetailResponse {
        let endpoint = MovieDetailAPI.getMovieDetail(id: id)
        return try await networker.requestAsync(type: MovieDetailResponse.self, endPoint: endpoint)
    }
}

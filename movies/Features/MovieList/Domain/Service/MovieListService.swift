//
//  MovieListService.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

protocol MovieListServiceProtocol {
    func fetchMovies(page: Int) async throws -> MovieListResponse
}

final class MovieListService: MovieListServiceProtocol{
    private let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }

    func fetchMovies(page: Int) async throws -> MovieListResponse {
        let endpoint = MovieListAPI.getMovieList(page: page)
        return try await networker.requestAsync(type: MovieListResponse.self, endPoint: endpoint)
    }
}

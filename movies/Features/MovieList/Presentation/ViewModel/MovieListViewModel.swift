//
//  MovieListViewModel.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

@Observable
class MovieListViewModel {
    var movies: [Movie] = []
    var isLoading: Bool = false
    var page: Int = 0
    var hasMore: Bool = true

    private let movieListService: MovieListServiceProtocol

    init(movieListService: MovieListServiceProtocol = MovieListService()) {
        self.movieListService = movieListService
    }

    func loadData() async{
        guard !isLoading && movies.isEmpty else { return }

        self.isLoading = true
        self.page = 1
        self.hasMore = true

        do {
            let moviesResponse = try await movieListService.fetchMovies(page: page)
            self.movies.append(contentsOf: moviesResponse.results)
            self.hasMore = moviesResponse.page < 500
            self.page = moviesResponse.page + 1
        }catch{
            print("Error Loading More Data: \(error)")
        }

        self.isLoading = false
    }

    func loadMoreData() async {
        guard !isLoading, hasMore else { return }
        
        self.isLoading = true
        
        do {
            let response = try await movieListService.fetchMovies(page: page)
            self.movies.append(contentsOf: response.results)
            self.hasMore = response.page < 500
            self.page = response.page + 1
        }catch {
            print("Error Loading More Data: \(error)")
        }

        self.isLoading = false
    }
}

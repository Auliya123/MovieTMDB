//
//  MovieDetailViewModel.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

import SwiftUI

@Observable
class MovieDetailViewModel {
    var movie: MovieDetailResponse?
    var isLoading: Bool = false

    private let movieDetailService: MovieDetailServiceProtocol

    init(movieDetailService: MovieDetailServiceProtocol = MovieDetailService()) {
        self.movieDetailService = movieDetailService
    }

    func loadDetail(id: Int) async {
        self.isLoading = true
        defer { isLoading = false }

        do {
            let response = try await movieDetailService.fetchMovieDetail(id: id)
            self.movie = response
        }catch{
            print("Error Fetching Data: \(error)")
        }
        
    }

}

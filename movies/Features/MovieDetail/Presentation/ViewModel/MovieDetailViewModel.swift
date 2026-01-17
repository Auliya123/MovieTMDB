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
    var trailer: URL?
    var alertMessage: String?
    var isLoading: Bool = false
    var isTrailerPresented = false
    var isAlertPresented = false

    private let movieDetailService: MovieDetailServiceProtocol
    private let movieVideoService: MovieVideoServiceProtocol

    init(movieDetailService: MovieDetailServiceProtocol = MovieDetailService(),
         movieVideoService: MovieVideoServiceProtocol = MovieVideoService()) {
        self.movieDetailService = movieDetailService
        self.movieVideoService = movieVideoService
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

    func getTrailerVideo(id: Int) async {
        self.isLoading = true
        defer { isLoading = false }

        do {
            let response = try await movieVideoService.fetchMovieVideo(id: id)
            self.trailer = response.results.first?.trailerURL
        }catch{
            print("Error Fetching Data: \(error)")
        }
    }


    func onTrailerTapped() {
        guard trailer != nil else {
            alertMessage = "Trailer is not available for this movie."
            isAlertPresented = true
            return
        }
          isTrailerPresented = true
      }

}

//
//  MovieDetailView.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import SwiftUI
import WebKit

struct MovieDetailView: View {
    @State var viewModel: MovieDetailViewModel
    let movieId: Int

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 100)
                } else if let movie = viewModel.movie {
                    MovieHeaderMolecule(
                        backdropURL: movie.backdropURL,
                        posterURL: movie.posterURL,
                        title: movie.title,
                        runtimeText: movie.runtimeText ?? "-"
                    ) {
                        viewModel.onTrailerTapped()
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        MovieNameAtom(
                            name: "Overview",
                            style: .sectionTitle
                        )
                        ContentCardAtom {
                            MovieNameAtom(
                                name: movie.overview,
                                style: .normalText
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        MovieNameAtom(
                            name: "Reviews",
                            style: .sectionTitle
                        )

//                        ForEach(viewModel.reviews.prefix(3)) { review in
//                            MovieReviewMolecule(avatarURL: review.authorDetails?.avatarURL, author: review.author, ratingText: review.authorDetails?.ratingPercent ?? "NR", dateText: review.createdAtText, review: review.content)
//                        }

                        if viewModel.reviews.isEmpty {
                            Text("No reviews available yet.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.vertical, 16)
                        } else {
                            let previewReviews = Array(viewModel.reviews.prefix(3))

                            ForEach(previewReviews) { review in
                                MovieReviewMolecule(
                                    avatarURL: review.authorDetails?.avatarURL,
                                    author: review.author,
                                    ratingText: review.authorDetails?.ratingPercent ?? "NR",
                                    dateText: review.createdAtText,
                                    review: review.content
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }

            }
            .padding(.top, 16)
        }
        .background(Color.black.opacity(0.02))
        .sheet(isPresented: $viewModel.isTrailerPresented) {
            if let url = viewModel.trailer {
                WebViewAtom(url: url)
                    .ignoresSafeArea()
            }
        }
        .alert("Oops", isPresented: $viewModel.isAlertPresented) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.alertMessage ?? "")
        }
        .task {
            await viewModel.loadDetail(id: movieId)
            await viewModel.getTrailerVideo(id: movieId)
            await viewModel.getMovieReviews(id: movieId)
        }
    }
}


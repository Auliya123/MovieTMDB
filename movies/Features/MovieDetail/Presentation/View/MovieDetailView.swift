//
//  MovieDetailView.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import SwiftUI

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
                        print("trailer tapped")
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

                        MovieReviewMolecule(avatarURL: URL(string: Constants.imageBaseURL + "/yz2HPme8NPLne0mM8tBnZ5ZWJzf.jpg"), author: "CinemaSerf", ratingText: "70%", dateText: "August 13, 2025", review: "Right from the outset, this doesn’t hang about as a near perfectly executed crypto robbery is carried out by a gang of young men in Macau. Despite mobilising the police and the several thousand cameras located across the city, the cops are short on clues so they draft in retired “Wong” (Jackie Chan) whose meticulous approach to his work soon leads them to suspect that the legendary “Shadow” is masterminding a group of ninja-esque men who are masters of disguise, martial arts and technology. He decides that the only way to track this man down is to recruit a squad of officers that don’t look remotely like they are investigating and then to embark on the mother of all door-to-door searches. Of course, and maybe a little implausibly, they manage to identify him (Tony Leung) - we know who it is right from the start - and a war of attrition ensues not just between the two men, but amongst their nemesis’s increasingly manoeuvred and conflicted “family” for whom trust and loyalty are soon severely tested. There is loads of action throughout, but it’s not the repetitious sort. More stylishly and tightly edited and choreographed with no windows, bones or furniture safe as the CGI and the action mix well before a denouement that offers us something of a twist and perhaps the scent of a revenge sequel down the line. The charismatic Chan brings a considered charm to his role, most of his antagonists are very agile and easy on the eye and Leung really does bring a little of the “Fu Manchu” to his character - powerful, menacing and always one step ahead. You might not be so certain about the safety of your bit-coin billions after watching this, though!")
                    }
                    .padding(.horizontal)
                }

            }
            .padding(.top, 16)
            .background(Color.black.opacity(0.02))
        }
        .task {
            await viewModel.loadDetail(id: movieId)
        }
    }
}


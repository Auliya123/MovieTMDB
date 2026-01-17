//
//  MovieRowMolecule.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

struct MovieRowMolecule: View {
    let movie: Movie

    var body: some View {
        VStack(spacing: 12){

            ZStack(alignment: .bottomLeading) {
                if let posterUrl = movie.posterUrl {
                    MovieImageAtom(
                        url: posterUrl,
                        width: 160,
                        height: 240
                    )
                }else{
                    PosterPlaceholderAtom(width: 160, height: 240)
                }

                RatingBadgeAtom(value: movie.voteAverage)
                    .offset(x: 8, y: 28)
            }

            VStack(alignment: .leading, spacing: 4) {
                MovieNameAtom(
                    name: movie.title,
                    style: .cardTitle
                )
                .multilineTextAlignment(.leading)

                MovieNameAtom(
                    name: DateFormatter.displayString(from: DateFormatter.tmdbAPIDate.date(from: movie.releaseDate)),
                    style: .cardDetail
                )
                .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
            .padding(.top, 24)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 4)
        .padding(.horizontal, 8)


    }
}

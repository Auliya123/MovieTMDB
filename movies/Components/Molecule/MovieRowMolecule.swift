//
//  MovieRowMolecule.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

struct MovieRowMolecule: View {
    var releaseDate = DateFormatter.tmdbAPIDate.date(from: "2025-11-05")

    var body: some View {
        VStack(spacing: 12){

            ZStack(alignment: .bottomLeading) {
                MovieImageAtom(
                    url: URL(string: "https://image.tmdb.org/t/p/w500/pHpq9yNUIo6aDoCXEBzjSolywgz.jpg"),
                    width: 160,
                    height: 240
                )

                RatingBadgeAtom(value: 78)
                    .offset(x: 8, y: 28) // 👈 pushes it below the image
            }

            VStack(alignment: .leading, spacing: 4) {
                           MovieNameAtom(
                               name: "Predator: Badlands",
                               style: .cardTitle
                           )

                           MovieNameAtom(
                               name: DateFormatter.displayString(from: releaseDate),
                               style: .cardDetail
                           )
                       }
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

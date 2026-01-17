//
//  MovieReviewMolecule.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

import SwiftUI

struct MovieReviewMolecule: View {
    let avatarURL: URL?
    let author: String
    let ratingText: String
    let dateText: String?
    let review: String
    
    var body: some View {
        ContentCardAtom{
            HStack(spacing: 12) {
                if let avatarURL{
                    MovieImageAtom(url: avatarURL, width: 40, height: 40)
                        .clipShape(Circle())
                }else{
                    PosterPlaceholderAtom(width: 40, height: 40)
                        .clipShape(Circle())
                }

                VStack(alignment: .leading, spacing: 4) {
                    MovieNameAtom(
                        name: "A review by \(author)",
                        style: .cardTitle
                    )
                    
                    HStack(spacing: 8) {
                        UserRatingAtom(percentText: ratingText)
                        
                        MovieNameAtom(
                            name: dateText ?? "-",
                            style: .cardDetail
                        )
                    }
                }
            }
            MovieNameAtom(
                name: review,
                style: .normalText
            ).lineLimit(4)
        }
    }
}


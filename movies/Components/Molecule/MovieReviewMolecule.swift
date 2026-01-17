//
//  MovieReviewMolecule.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

import SwiftUI

struct MovieReviewMolecule: View {
    let review: MovieReview

    var body: some View {
        ContentCardAtom{
            HStack(spacing: 12) {
                if let avatarURL = review.authorDetails?.avatarURL{
                    MovieImageAtom(url: avatarURL, width: 40, height: 40)
                        .clipShape(Circle())
                }else{
                    PosterPlaceholderAtom(width: 40, height: 40)
                        .clipShape(Circle())
                }

                VStack(alignment: .leading, spacing: 4) {
                    MovieNameAtom(
                        name: "A review by \(review.author)",
                        style: .cardTitle
                    )
                    
                    HStack(spacing: 8) {
                        UserRatingAtom(percentText: review.authorDetails?.ratingPercent ?? "NR")

                        MovieNameAtom(
                            name: review.createdAtText ?? "-",
                            style: .cardDetail
                        )
                    }
                }
            }
            MovieNameAtom(
                name: review.content,
                style: .normalText
            ).lineLimit(4)
        }
    }
}


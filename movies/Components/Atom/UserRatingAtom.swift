//
//  UserRatingAtom.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//
import SwiftUI

struct UserRatingAtom: View {
    let percentText: String

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .font(.caption2)
                .foregroundColor(.white)

            Text(percentText)
                .font(.caption.bold())
                .foregroundColor(.white)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(Color(red: 0.08, green: 0.16, blue: 0.28)) // navy color
        )
    }
}

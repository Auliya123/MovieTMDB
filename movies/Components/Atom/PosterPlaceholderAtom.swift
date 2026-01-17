//
//  MovieEmptyImageAtom.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import SwiftUI

struct PosterPlaceholderAtom: View {
    var width: CGFloat = 80
    var height: CGFloat = 80

    var body: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.gray.opacity(0.5))
            .frame(maxWidth: width * 0.5, maxHeight: height * 0.5)
            .frame(width: width, height: height)
    }
}

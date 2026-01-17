//
//  MovieCardAtom.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

import SwiftUI

struct ContentCardAtom<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            content
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
    }
}

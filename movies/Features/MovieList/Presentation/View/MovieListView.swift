//
//  MovieListView.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

struct MovieListView: View {
    let movies = Array(0..<10)

    private let columns = [ GridItem(), GridItem()  ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(movies, id: \.self) { _ in
                    Button {
                        print("Button Tapped")
                    } label: {
                        MovieRowMolecule()
                    }
                    .listRowSeparator(.hidden)
                }
            }
        }
        .navigationTitle("Popular Movies")
    }
}

//
//  MovieImageAtom.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

struct MovieImageAtom: View {
    let url: URL?
    var width: CGFloat = 80
    var height: CGFloat = 80

    var body: some View {
        AsyncImage(url: url){phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
            case .failure(let error):
                Image(systemName: "exclamationmark.icloud.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width * 0.5, height: height * 0.5)
                    .foregroundStyle(.gray.opacity(0.5))
                    .frame(width: width, height: height)
            @unknown default:
                EmptyView()
            }
        }
    }
}

//
//  MovieNameAtom.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

enum MovieNameStyle{
    case cardTitle
    case cardDetail
}

struct MovieNameAtom: View {
    let name: String
    let style: MovieNameStyle

    var body: some View {
        Text(name.capitalized)
            .font(fontForStyle(style))
            .foregroundStyle(colorForStyle(style))
    }

    private func fontForStyle(_ style: MovieNameStyle) -> Font {
        switch style {
        case .cardTitle:
            return .system(size: 16, weight: .bold)
        case .cardDetail:
            return .system(size: 12, weight: .medium)
        }
    }

    private func colorForStyle(_ style: MovieNameStyle) -> Color {
        switch style {
        case .cardDetail:
                .secondary
        default:
                .primary
        }
    }

}

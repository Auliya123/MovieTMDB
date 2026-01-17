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
    case whiteTitle
    case whiteSubtitle
    case sectionTitle
    case normalText
}

struct MovieNameAtom: View {
    let name: String
    let style: MovieNameStyle

    var body: some View {
        Text(name)
            .font(fontForStyle(style))
            .foregroundStyle(colorForStyle(style))
    }

    private func fontForStyle(_ style: MovieNameStyle) -> Font {
        switch style {
        case .cardTitle:
            return .system(size: 16, weight: .bold)
        case .cardDetail,  .whiteSubtitle:
            return .system(size: 12, weight: .medium)
        case .whiteTitle:
            return .system(size: 24, weight: .bold)
        case .normalText:
            return .system(size: 12, weight: .light)
        case .sectionTitle:
            return .system(size: 20, weight: .bold)
        }
    }

    private func colorForStyle(_ style: MovieNameStyle) -> Color {
        switch style {
        case .cardDetail:
                .secondary
        case .whiteTitle, .whiteSubtitle:
                .white
        default:
                .primary
        }
    }

}

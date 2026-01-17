//
//  MovieHeaderMolecule.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import SwiftUI

struct MovieHeaderMolecule: View {
    let backdropURL: URL?
    let posterURL: URL?
    let title: String
    let runtimeText: String
    let onTrailerTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            MovieImageAtom(
                url: backdropURL,
                height: 280
            ).frame(maxWidth: .infinity)
            
            // Gradient for readability
            LinearGradient(
                colors: [
                    .black.opacity(0.0),
                    .black.opacity(0.85)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 280)
            
            HStack(alignment: .bottom, spacing: 16) {
                
                MovieImageAtom(
                    url: posterURL,
                    width: 110,
                    height: 165
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    MovieNameAtom(
                        name: title,
                        style: .whiteTitle
                    )
                    
                    HStack{
                        IconButtonAtom(icon: "play.fill", text: "TRAILER", action: onTrailerTap)
                        
                        MovieNameAtom(
                            name: runtimeText,
                            style: .whiteSubtitle
                        )
                    }
                }
            }
            .padding()
        }
    }
}

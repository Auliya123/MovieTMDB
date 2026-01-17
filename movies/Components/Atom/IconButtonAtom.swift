//
//  IconButtonAtom.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import SwiftUI

struct IconButtonAtom: View  {
    var icon: String
    var text: String
    var action: () -> Void

    var body: some View{
        Button(action: action) {
                  HStack(spacing: 6) {
                      Image(systemName: icon)
                          .font(.caption)

//                      Text(text)
//                          .font(.caption.bold())
                      MovieNameAtom(name: text, style: .whiteSubtitle)
                  }
                  .foregroundColor(.white.opacity(0.9))
                  .padding(.horizontal, 12)
                  .padding(.vertical, 6)
                  .background(
                      Capsule()
                          .fill(Color.white.opacity(0.15))
                  )
                  .overlay(
                      Capsule()
                          .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
                  )
              }
              .buttonStyle(.plain)
    }

}

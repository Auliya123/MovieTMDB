//
//  RatingBadgeAtom.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

struct RatingBadgeAtom: View {
    let value: Int


    private var progress: Double {
        Double(value) / 100
    }

    private var strokeColor: Color {
        switch value {
        case 70...100: return .green
        case 40..<70: return .yellow
        default: return .red
        }
    }

    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .fill(Color.black.opacity(0.85))

            // Track
            Circle()
                .stroke(
                    Color.gray.opacity(0.3),
                    lineWidth: 4
                )

            // Progress ring
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    strokeColor,
                    style: StrokeStyle(
                        lineWidth: 4,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))

            Text("\(value)%")
                .font(.caption.bold())
                .foregroundColor(.white)
        }
        .frame(width: 44, height: 44)
    }
}


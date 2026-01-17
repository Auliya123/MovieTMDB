//
//  RatingBadgeAtom.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

struct RatingBadgeAtom: View {
    let value: Double

    private var progress: Double {
        min(max(value / 10, 0), 1)
    }

    private var percentValue: Int {
        Int((value * 10).rounded())
    }

    private var percentText: String {
        percentValue == 0 ? "NR" : "\(percentValue)%"
    }


    private var strokeColor: Color {
        switch value {
        case 7.0...10.0: return .green
        case 4.0..<7.0: return .yellow
        default: return .gray
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

            Text(percentText)
                .font(.caption.bold())
                .foregroundColor(.white)
        }
        .frame(width: 44, height: 44)
    }
}


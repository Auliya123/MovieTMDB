//
//  Integer.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//
import Foundation

extension Int {
    var hoursAndMinutes: String {
        let hours = self / 60
        let minutes = self % 60
        return "\(hours)h \(minutes)m"
    }
}

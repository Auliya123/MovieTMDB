//
//  DateFormatter.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//
import Foundation

extension DateFormatter {

    /// date format: yyyy-MM-dd
    static let tmdbAPIDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    /// Display format: 17 May 2024
    static let displayMedium: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    static func displayString(from date: Date?, placeholder: String = "-") -> String {
        guard let date else { return placeholder }
        return displayMedium.string(from: date)
    }
}

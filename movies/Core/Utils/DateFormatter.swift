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

    /// TMDB ISO: 2018-06-09T17:51:53.359Z
    static let tmdbISO: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        return formatter
    }()

    /// Display format: 17 May 2024
    static let displayMedium: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    /// Convert Date  -> display string
    static func displayString(from date: Date?, placeholder: String = "-") -> String {
        guard let date else { return placeholder }
        return displayMedium.string(from: date)
    }

    /// Convert ISO 8601 string -> display string
    static func displayString(fromISO8601 string: String?, placeholder: String = "-") -> String {
        guard
            let string,
            let date = tmdbISO.date(from: string)
        else {
            return placeholder
        }

        return displayMedium.string(from: date)
    }
}

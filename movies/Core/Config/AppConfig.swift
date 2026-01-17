//
//  AppConfig.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 18/01/26.
//

import Foundation

enum AppConfig {

    static var tmdbAPIKey: String {
        guard
            let key = Bundle.main.object(
                forInfoDictionaryKey: "TMDB_API_KEY"
            ) as? String,
            !key.isEmpty
        else {
            fatalError("TMDB_API_KEY is missing in Info.plist")
        }

        return key
    }
}

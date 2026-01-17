//
//  AppDependencies.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import SwiftUI

@Observable
class AppDependencies {
    func makeListViewModel() -> MovieListViewModel {
        return MovieListViewModel()
    }

    func makeDetailViewModel() -> MovieDetailViewModel {
        return MovieDetailViewModel()
    }
}

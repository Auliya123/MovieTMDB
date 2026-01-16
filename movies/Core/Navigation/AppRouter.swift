//
//  AppRouter.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

enum AppRoute: Hashable {
    case list
}

@Observable
final class AppRouter {
    var path:[AppRoute] = []

    func push(_ route: AppRoute){
        path.append(route)
    }

    func pop(){
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot(){
        path.removeAll()
    }
}

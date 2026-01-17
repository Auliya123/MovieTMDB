//
//  AppNavigationModifier.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 17/01/26.
//

import SwiftUI

struct AppNavigationModifier: ViewModifier {
    var dependencies: AppDependencies

    func body(content: Content) -> some View {
        content
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .list:
                    let vm = dependencies.makeListViewModel()
                    MovieListView(viewModel: vm)
                case .detail(let id):
                    MovieDetailView()
                }
            }
    }
}

extension View {
    func withAppRouter(dependencies: AppDependencies) -> some View {
        modifier(AppNavigationModifier(dependencies: dependencies))
    }
}

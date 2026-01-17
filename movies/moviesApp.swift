//
//  moviesApp.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

@main
struct moviesApp: App {
    @State private var router = AppRouter()
    @State private var dependencies = AppDependencies()



    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path){
                let listVM = dependencies.makeListViewModel()
                MovieListView(viewModel: listVM)
                    .withAppRouter(dependencies: dependencies)
            }
            .environment(router)
        }
    }
}

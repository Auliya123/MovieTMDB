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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path){
                MovieListView()
            }
        }
    }
}

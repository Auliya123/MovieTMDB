//
//  MovieListView.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import SwiftUI

struct MovieListView: View {
    @Environment(AppRouter.self) var router
    @State var viewModel: MovieListViewModel

    private let columns = [ GridItem(), GridItem()  ]


    var body: some View {
        ScrollView {

            if viewModel.isLoading && viewModel.movies.isEmpty {
                ProgressView("Finding Popular Movies...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }else{

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.movies) { movie in
                        Button {
                            router.push(.detail(id: movie.id))
                        } label: {
                            MovieRowMolecule(movie: movie)
                        }
                        .onAppear{
                            if movie.id == viewModel.movies.last?.id {
                                Task{
                                    await viewModel.loadMoreData()
                                }
                            }
                        }
                    }
                }
            }

            if viewModel.isLoading && !viewModel.movies.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationTitle("Popular Movies")
        .task {
            await viewModel.loadData()
        }
    }
}

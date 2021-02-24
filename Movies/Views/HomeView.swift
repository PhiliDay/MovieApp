//
//  ContentView.swift
//  Movies
//
//  Created by Philippa Day on 22/02/2021.
//

import SwiftUI

struct HomeView: View {
    @State var movies: [Movie] = []
    @State private var tapped: Bool = false
    @State private var isLoading: Bool = false

    @ViewBuilder
    var body: some View {
//        Need to figure out this
//        if movies.isEmpty {
//            noDataView
//        }
//        else {
            mainMovieListView
//        }
    }

    var noDataView: some View {
        VStack {
            Text("No Data").padding()
            Button("Fetch Data") {
                fetchMovies()
            }
        }
    }

    var errorView: some View {
        VStack {
            Text("Error View")
        }
    }

    var mainMovieListView: some View {
        NavigationView {
        List {
            ForEach(movies) { movie in
                NavigationLink(destination: DetailView(movie: movie)) {
                VStack {
                    HStack {
                        SmallImageWithURL(movie.image)
                        VStack(alignment: .leading) {
                            Text(movie.fullTitle)
                                .font(.system(size: 15))
                            Text(UI.Strings.rating + "\(movie.imDbRating)")
                                .font(.system(size: 15))
                        }
                        Image(UI.Strings.chevronIcon)
                            .onTapGesture(perform: {
                                withAnimation(.easeInOut(duration: 1)) {
                                    tapped.toggle()
                                }
                            })
                    }

                    if tapped {
                        Text(movie.crew)
                            .padding()
                            .clipped()
                    }
                }
                }
            }.onDelete(perform: deleteRow)
             .onMove(perform: onMove)
            }.onAppear() {
                fetchMovies()
            }
            .navigationBarItems(leading: EditButton())
        .navigationBarTitle(UI.Strings.topMovies, displayMode: .inline)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    private func deleteRow(at indexSet: IndexSet) {
        self.movies.remove(atOffsets: indexSet)
    }

    private func onMove(source: IndexSet, destination: Int) {
        self.movies.move(fromOffsets: source, toOffset: destination)
    }

    private func fetchMovies() {
        NetworkManager().getMovies { result in
            switch result {
            case .success(let results):
                self.movies = results
            case .failure(let error):
                print(error)
            }
        }
    }
}

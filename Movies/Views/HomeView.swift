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

    @ViewBuilder
    var body: some View {
        mainMovieListView
    }

    var noDataView: some View {
        VStack {
            Text("No Data").padding()
            Button("Fetch Data") {
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
                                withAnimation(.easeInOut(duration: 0.5)) {
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
            }.onDelete(perform: self.deleteRow)
             .onMove(perform: onMove)
            }.onAppear() {
                Api().getMovies { result in
                    switch result {
                    case .success(let results):
                        self.movies = results
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            .navigationBarItems(leading: EditButton())
        .navigationBarTitle(UI.Strings.topMovies, displayMode: .inline)
        }
    }

    private func deleteRow(at indexSet: IndexSet) {
        self.movies.remove(atOffsets: indexSet)
    }

    private func onMove(source: IndexSet, destination: Int) {
        self.movies.move(fromOffsets: source, toOffset: destination)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

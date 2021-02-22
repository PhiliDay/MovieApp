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

    var body: some View {
        NavigationView {
            List {
                ForEach(movies) { movie in
                    VStack {
                        HStack {
                            ImageView(withURL: movie.image)
                            VStack(alignment: .leading) {
                                Text(movie.fullTitle)
                                Text("Rating: \(movie.imDbRating)")
                            }
                            Image("Icon-ChevronUpDown")
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
                    NavigationLink(destination: DetailView()) {
                        Text("Do Something")
                    }
                }.onDelete(perform: self.deleteRow)
                 .onMove(perform: onMove)
                }.onAppear() {
                    Api().getMovies { (movies) in
                        self.movies = movies
                    }
                }
                .navigationBarItems(leading: EditButton())
                .navigationBarTitle(Text("Top Movies"))
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

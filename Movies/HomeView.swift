//
//  ContentView.swift
//  Movies
//
//  Created by Philippa Day on 22/02/2021.
//

import SwiftUI

struct HomeView: View {
    @State var movies: [Movie] = []

    var body: some View {
        List(movies) { movie in
            Text(movie.title)
                .padding()
        }.onAppear() {
            Api().getMovies { (movies) in
                self.movies = movies
        }
    }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  CellView.swift
//  Movies
//
//  Created by Philippa Day on 22/02/2021.
//

import SwiftUI

struct CellView: View {
    @State var movies: [Movie] = []
    @State private var tapped: Bool = false

    var body: some View {
        List(movies) { movie in
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
        }.onAppear() {
            Api().getMovies { (movies) in
                self.movies = movies
            }
        }
    }
}


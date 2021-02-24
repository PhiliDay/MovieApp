//
//  DetailView.swift
//  Movies
//
//  Created by Philippa Day on 22/02/2021.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    @State private var tapped: Bool = false

    var body: some View {
        if !tapped {
        topView

        .navigationBarTitle(movie.title, displayMode: .inline)
        .navigationBarItems(trailing:
                                Image(UI.Strings.upDownArrow).onTapGesture {
                                    tapped.toggle()
                                })
        }
        if tapped {
            bottomView
        }
    }

    var topView: some View {
        VStack(alignment: .leading) {
            BigImageWithURL(movie.image)
            Text(movie.fullTitle)
            Text(UI.Strings.rating + "\(movie.imDbRating)")
            Text(movie.crew)
        }.padding()
    }

    var bottomView: some View {
        VStack(alignment: .leading) {
            Text(movie.fullTitle)
            Text(UI.Strings.rating + "\(movie.imDbRating)")
            Text(movie.crew)
            BigImageWithURL(movie.image)
        }.padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie.example)
    }
}

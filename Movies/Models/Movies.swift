//
//  Movies.swift
//  Movies
//
//  Created by Philippa Day on 22/02/2021.
//

import Foundation

struct Movies: Codable, Identifiable {
    let id = UUID()
    let items: [Movie]

    enum CodingKeys: String, CodingKey {
        case id = "_id", items
    }
}

struct Movie: Codable, Identifiable {
    let id = UUID()
    let fullTitle: String
    let title: String
    let image: String
    let crew: String
    let imDbRating: String

    enum CodingKeys: String, CodingKey {
        case id = "_id", fullTitle, title, image, crew, imDbRating
    }

    #if DEBUG
    static let example = Movie(fullTitle: "Example Movie", title: "Example Title", image: "Example Image", crew: "Example Crew", imDbRating: "Example Rating")
    #endif
}

class Api {
    @Published var loading = false

    func getMovies(completion: @escaping ([Movie]) -> ()) {
        guard let url = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_x3hy019r") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            self.loading = true
            let movies = try! JSONDecoder().decode(Movies.self, from: data)
            print(movies)
            let movie = movies.items
            DispatchQueue.main.async {
                completion(movie)
                self.loading = false
            }
        }.resume()
    }

}

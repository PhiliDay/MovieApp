//
//  NetworkManager.swift
//  Movies
//
//  Created by Philippa Day on 22/02/2021.
//

import UIKit
import Combine

enum NetworkError: Error {
    case badData
    case failedToParseData
    case systemError
}

class Api {
    @Published var loading = false

    func getMovies(completion: @escaping ([Movie]) -> ()) {
        guard let url = URL(string: UI.Strings.url) else {
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

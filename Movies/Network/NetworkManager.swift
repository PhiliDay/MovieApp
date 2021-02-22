//
//  NetworkManager.swift
//  Movies
//
//  Created by Philippa Day on 22/02/2021.
//

import UIKit

enum NetworkError: Error {
    case badData
    case failedToParseData
    case systemError
}

/// This class handles all the networking to the Just Eat API.
///
/// NB: Call the singleton `shared()` to use this class.
//class NetworkManager {
//
//    // MARK: - Properties
//    private lazy var baseURL = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_x3hy019r")
//
//    /// Fetch a list of movies from a string input.
//    ///
//    func fetchMovies() {
//        // URL
//        guard let url = baseURL else {
//            print("Issue with baseURL: \(#function)")
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(Movies.self, from: data) {
//                    // we have good data – go back to the main thread
//                    DispatchQueue.main.async {
//                        // update our UI
//                        self.movies = decodedResponse.items
//                    }
//
//                    // everything is good, so we can exit
//                    return
//                }
//            }
//
//            // if we're still here it means there was a problem
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//    }
//}

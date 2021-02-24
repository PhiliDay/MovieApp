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

class NetworkManager {
    func getMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        // URL
        guard let url = URL(string: UI.Strings.url) else {
            print("BaseURL not working")
            return
        }

        // Network Call
        URLSession.shared.dataTask(with: url) { data, response, error -> Void in
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                print("Error with data")
                return
            }

            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let movies = try jsonDecoder.decode(Movies.self, from: data)
                let movie = movies.items

                DispatchQueue.main.async {
                    completion(.success(movie))
                }
            } catch {
                print("Failure: \(error.localizedDescription)")
                completion(.failure(NetworkError.failedToParseData))
                return
            }
        }.resume()
    }
    
}

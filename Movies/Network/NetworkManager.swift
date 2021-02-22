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

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

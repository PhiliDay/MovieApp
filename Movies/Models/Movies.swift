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


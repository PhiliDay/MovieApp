//
//  Movie.swift
//  Movies
//
//  Created by Philippa Day on 24/02/2021.
//

import Foundation

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

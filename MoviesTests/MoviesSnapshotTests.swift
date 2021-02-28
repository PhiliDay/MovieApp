//
//  MoviesSnapshotTests.swift
//  MoviesTests
//
//  Created by Philippa Day on 28/02/2021.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import Movies

class MovieSnapshotTests: XCTestCase {

    func testDefaultAppearance() {
        // test empty list
        let homeView = HomeView().mainMovieListView
        
        assertSnapshot(
            matching: homeView,
            as: .image 
        )
    }

    func testMovieList() {
        // test one movie in list
        let movie = Movie(fullTitle: "TEST", title: "TEST", image: "TEST", crew: "TEST", imDbRating: "0")
        let homeView = HomeView(movies: [movie], count: 1).mainMovieListView
        assertSnapshot(
            matching: homeView,
            as: .image
        )
    }
}

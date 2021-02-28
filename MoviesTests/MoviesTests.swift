//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Philippa Day on 22/02/2021.
//

import XCTest
@testable import Movies

class MoviesTests: XCTestCase {

    var movie: Movie?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movie = Movie(fullTitle: "TestFullTitle", title: "TestTitle", image: "TestImage", crew: "TestCrew", imDbRating: "TestRating")

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testMovieFullTitle() {
        XCTAssertTrue(movie?.fullTitle == "TestFullTitle", "Fail, name incorrect")
    }

    func testMovieTitle() {
        XCTAssertTrue(movie?.title == "TestTitle", "Fail, name incorrect")
    }

    func testMovieImage() {
        XCTAssertTrue(movie?.image == "TestImage", "Fail, name incorrect")
    }

    func testMovieCrew() {
        XCTAssertTrue(movie?.crew == "TestCrew", "Fail, name incorrect")
    }

    func testImDbRating() {
        XCTAssertTrue(movie?.imDbRating == "TestRating", "Fail, name incorrect")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

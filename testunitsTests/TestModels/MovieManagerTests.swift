import XCTest

@testable import testunits

class MovieManagerTests: XCTestCase {

    var sut: MovieManager!
    
    let nerdMovie = Movie(title: "Nerd Movie")
    let muchNerdMovie = Movie(title: "Nerd Nerd Movie")
    let evenMoreNerdMovie = Movie(title: "Nerd Nerd Nerd Movie")
    
    override func setUpWithError() throws {
        
        sut = MovieManager()
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {

    }

    func testInit_MovieToSee_ReturnZero() {
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnZero() {

        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    func testAdd_MoviesToSee_ReturnOne () {
        
        sut.addMovie(movie: nerdMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex() {
        
        
        sut.addMovie(movie: muchNerdMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(muchNerdMovie.title, movieQueried.title)
    }
    
    func testCheckOffMovie_UpdatesMoviesManagerCount () {
        
        sut.addMovie(movie: evenMoreNerdMovie)
        sut.checkOffMovieAtIndex(index: 0)
                     
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
                     
    }
    
    func testCheckOffMovie_RemoveMovieFromArray() {
        
        sut.addMovie(movie: nerdMovie)
        sut.addMovie(movie: muchNerdMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, muchNerdMovie.title)
    }
    
    func testCheckOffMovie_ReturnMovieAtIndex(){
        sut.addMovie(movie: nerdMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex (index: 0)
        XCTAssertEqual(nerdMovie.title, movieQueried.title)
    }
    
    func testClearArrays_ReturnsArrayCountsOfZero() {
        sut.addMovie(movie: nerdMovie)
        sut.addMovie(movie: muchNerdMovie)
        
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testDuplicateMovies_ShouldNotBeAddToArray(){
        sut.addMovie(movie: nerdMovie)
        sut.addMovie(movie: nerdMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}

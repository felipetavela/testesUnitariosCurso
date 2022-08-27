import XCTest

@testable import testunits

class MovieStructTest: XCTestCase {

    override func setUpWithError() throws {
        

        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MovieWithTitle () {
        let testMovie = Movie(title: "Blockbuster Nerd")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Blockbuster Nerd")
        
    }
    
    func testInit_SetMovieTitleAndReleaseDate(){
        let testMovie = Movie(title: "Romantic nerd", releaseDate: "1948")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1948")
    }
    
    func testEquatable_ReturnsTrue () {
        
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1948")
        let actionMovie2 = Movie(title: "Adventure", releaseDate: "1949")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
}

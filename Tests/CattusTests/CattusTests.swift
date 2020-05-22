import XCTest
@testable import Cattus

final class CattusTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Cattus().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

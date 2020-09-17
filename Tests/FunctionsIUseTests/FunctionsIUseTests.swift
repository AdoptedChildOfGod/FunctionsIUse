import XCTest
@testable import FunctionsIUse

final class FunctionsIUseTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FunctionsIUse().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

import XCTest
@testable import MieContacts

final class MieContactsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MieContacts().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

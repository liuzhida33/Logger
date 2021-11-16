import XCTest
@testable import Logger

final class LoggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let logger = SimpleLogger()
        logger.setLogLevel(.verbose)
        logger.d("测试")
        logger.v("测试")
    }
}

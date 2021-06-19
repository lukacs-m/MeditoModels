    import XCTest
    @testable import MeditoModels
    
    final class MeditoModelsTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            
           let shorstcuts = ModelsMockFactory.getMockShortcutsContainer()
            let data = shorstcuts?.toJSONData()
            let testShorcuts = try! ShortcutsContainer(data: data!)

            XCTAssertEqual(testShorcuts.shortcuts.count, 4)
        }
    }

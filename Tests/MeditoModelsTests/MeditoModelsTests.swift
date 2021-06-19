    import XCTest
    @testable import MeditoModels
    
    final class MeditoModelsTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            
             let article = Article(id: 1, title: "test", subtitle: "test2", body: "wooot")
            XCTAssertEqual(article.getType(), ContentType.article.rawValue)
        }
    }

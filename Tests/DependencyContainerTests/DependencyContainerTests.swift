import XCTest
@testable import DependencyContainer

final class DependencyContainerTests: XCTestCase {
    
    let sut = Container()
    
    func testExample() throws {
        
        // Given
        sut
            .register { A_Service() as A_Serviceable }
            .register { B_Service() as B_Serviceable }
        
        // When
        var aService: A_Serviceable { sut.resolve() }
        var bService: B_Serviceable { sut.resolve() }
        
        // Then
        XCTAssertEqual(aService.fetch(), "A Fetch")
        XCTAssertEqual(bService.fetch(), "B Fetch")
    }
}

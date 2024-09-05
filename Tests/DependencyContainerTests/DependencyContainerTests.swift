import XCTest
@testable import DependencyContainer

final class DependencyContainerTests: XCTestCase {
    
    @MainActor func test_Live() {
        
        let sut = Container()
        
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
    
    @MainActor func test_fake() {
        
        let sut = Container()
        
        // Given
        sut
            .register { FakeA_Serivce() as A_Serviceable }
            .register { FakeB_Serivce() as B_Serviceable }
        
        // When
        var aService: A_Serviceable { sut.resolve() }
        var bService: B_Serviceable { sut.resolve() }
        
        // Then
        XCTAssertEqual(aService.fetch(), "Fake A Fetch")
        XCTAssertEqual(bService.fetch(), "Fake B Fetch")
    }
}

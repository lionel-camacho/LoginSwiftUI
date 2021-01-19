import XCTest
import SwiftUI
import MapKit
import CoreLocation
@testable import LoginSwiftUI

class UsersDetailViewModelTests: XCTestCase {
    
    private var systemUnderTest: UsersDetailViewModel!
    private var testUser = User(id: 1, name: "TestName", username: "TestUsername", email: "testEmail@test.com", address: Address(street: "Test Street", suite: "Test Suite", city: "Test City", zipcode: "00000", geo: Geo(lat: "53.404444", lng: "-0.2386")), phone: "+27831111111", website: URL(string: "https://google.com")!, company: Company(name: "Test Company Name", catchPhrase: "Test Catch Phrase", bs: "Test BS"))
    
    override func setUpWithError() throws {
        systemUnderTest = UsersDetailViewModel(user: testUser)
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
    }
    
    func testUsersDetailViewModelReturnsExpectedNavigationBarTitle() throws {
        XCTAssertEqual("User Details", systemUnderTest.navigationBarTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedNameTitle() throws {
        XCTAssertEqual("Name: ", systemUnderTest.nameTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedUsernameTitle() throws {
        XCTAssertEqual("Username: ", systemUnderTest.usernameTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedEmailTitle() throws {
        XCTAssertEqual("Email: ", systemUnderTest.emailTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedPhoneTitle() throws {
        XCTAssertEqual("Phone: ", systemUnderTest.phoneTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedWebsiteTitle() throws {
        XCTAssertEqual("Website: ", systemUnderTest.websiteTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedCityTitle() throws {
        XCTAssertEqual("City: ", systemUnderTest.cityTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedStreetTitle() throws {
        XCTAssertEqual("Street: ", systemUnderTest.streetTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedSuiteTitle() throws {
        XCTAssertEqual("Suite: ", systemUnderTest.suiteTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedZipcodeTitle() throws {
        XCTAssertEqual("Zipcode: ", systemUnderTest.zipcodeTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedCompanyTitle() throws {
        XCTAssertEqual("Company: ", systemUnderTest.companyTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedCatchPhraseTitle() throws {
        XCTAssertEqual("Catch Phrase: ", systemUnderTest.catchPhraseTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedBsTitle() throws {
        XCTAssertEqual("Bs: ", systemUnderTest.bsTitle)
    }
    
    func testUsersDetailViewModelReturnsExpectedRegion() throws {
        let expectedRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53.404444, longitude: -0.2386), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
        
        XCTAssertEqual(expectedRegion.center.latitude, systemUnderTest.region.center.latitude)
        XCTAssertEqual(expectedRegion.center.longitude, systemUnderTest.region.center.longitude)
        XCTAssertEqual(expectedRegion.span.latitudeDelta, systemUnderTest.region.span.latitudeDelta)
        XCTAssertEqual(expectedRegion.span.longitudeDelta, systemUnderTest.region.span.longitudeDelta)
    }
}

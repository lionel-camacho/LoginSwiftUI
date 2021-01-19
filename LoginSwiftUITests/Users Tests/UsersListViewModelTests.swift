import XCTest
import SwiftUI
@testable import LoginSwiftUI

class UsersListViewModelTests: XCTestCase {

    private var systemUnderTest = UsersListViewModel()
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testUsersListViewModelReturnsExpectedFailedToLoadUsersTitle() throws {
        XCTAssertEqual("Failed to load users", systemUnderTest.failedToLoadUsersTitle)
    }
    
    func testUsersListViewModelReturnsExpectedFailedToLoadUsersMessage() throws {
        XCTAssertEqual("An error occured while attempting to load users, please ensure you are connected to wifi or a mobile connection and try again.", systemUnderTest.failedToLoadUsersMessage)
    }
    
    func testUsersListViewModelReturnsExpectedRetryButtonTitle() throws {
        XCTAssertEqual("Retry", systemUnderTest.retryButtonTitle)
    }
    
    func testUsersListViewModelReturnsExpectedFetchingUsersTitle() throws {
        XCTAssertEqual("Fetching users…", systemUnderTest.fetchingUsersTitle)
    }
    
    func testUsersListViewModelReturnsExpectedNavigationBarTitle() throws {
        XCTAssertEqual("Users", systemUnderTest.navigationBarTitle)
    }
}

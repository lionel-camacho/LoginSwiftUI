import XCTest
import SwiftUI
@testable import LoginSwiftUI

class LoginViewModelTests: XCTestCase {

    private var systemUnderTest = LoginViewModel()
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testLoginViewModelReturnsExpectedWelcomeTitle() throws {
        XCTAssertEqual("Welcome!", systemUnderTest.welcomeTitle)
    }
    
    func testLoginViewModelReturnsExpectedAppIconName() throws {
        XCTAssertEqual("Icon", systemUnderTest.appIconName)
    }
    
    func testLoginViewModelReturnsExpectedUsernameTitle() throws {
        XCTAssertEqual("Username", systemUnderTest.usernameTitle)
    }
    
    func testLoginViewModelReturnsExpectedPasswordTitle() throws {
        XCTAssertEqual("Password", systemUnderTest.passwordTitle)
    }
    
    func testLoginViewModelReturnsExpectedLoginButtonTitle() throws {
        XCTAssertEqual("LOGIN", systemUnderTest.loginButtonTitle)
    }
    
    func testLoginViewModelReturnsExpectedLightGreyColor() throws {
        XCTAssertEqual(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), systemUnderTest.lightGreyColor)
    }

}

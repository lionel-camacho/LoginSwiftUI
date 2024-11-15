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
        XCTAssertEqual("Username (min 2 letters)", systemUnderTest.usernameTitle)
    }
    
    func testLoginViewModelReturnsExpectedPasswordTitle() throws {
        XCTAssertEqual("Password (min 2 letters)", systemUnderTest.passwordTitle)
    }
    
    func testLoginViewModelReturnsExpectedLoginButtonTitle() throws {
        XCTAssertEqual("Login", systemUnderTest.loginButtonTitle)
    }
    
    func testLoginViewModelReturnsExpectedLightGreyColor() throws {
        XCTAssertEqual(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), systemUnderTest.lightGreyColor)
    }
    
    func testLoginViewModelReturnsExpectedCreateNewAccountButtonTitle() throws {
        XCTAssertEqual("Create New Account", systemUnderTest.createNewAccountButtonTitle)
    }
    
    func testLoginViewModelReturnsExpectedUsernameAndPasswordMinimumLength() throws {
        XCTAssertEqual(2, systemUnderTest.usernameAndPasswordMinimumLength)
    }
    
    func testLoginViewModelUsernameValidation() throws {
        systemUnderTest.username = ""
        XCTAssertFalse(systemUnderTest.usernameValid)
        
        systemUnderTest.username = "U"
        XCTAssertFalse(systemUnderTest.usernameValid)
        
        systemUnderTest.username = "Us"
        XCTAssertTrue(systemUnderTest.usernameValid)
    }
    
    func testLoginViewModelPasswordValidation() throws {
        systemUnderTest.password = ""
        XCTAssertFalse(systemUnderTest.passwordValid)
        
        systemUnderTest.password = "P"
        XCTAssertFalse(systemUnderTest.passwordValid)
        
        systemUnderTest.password = "Pa"
        XCTAssertTrue(systemUnderTest.passwordValid)
    }
    
    func testLoginViewModelReturnsExpectedUsernameOrPasswordErrorAlertTitle() throws {
        XCTAssertEqual("Username or Password incorrect", systemUnderTest.usernameOrPasswordErrorAlertTitle)
    }
    
    func testLoginViewModelReturnsExpectedUsernameOrPasswordErrorAlertMessage() throws {
        XCTAssertEqual("Your username or password is incorrect, please try again.", systemUnderTest.usernameOrPasswordErrorAlertMessage)
    }
    
    func testLoginViewModelReturnsExpectedOkButtonTitle() throws {
        XCTAssertEqual("OK", systemUnderTest.okButtonTitle)
    }
    
    func testLoginViewModelReturnsExpectedNoAccountErrorAlertTitle() throws {
        XCTAssertEqual("No account found", systemUnderTest.noAccountErrorAlertTitle)
    }
    
    func testLoginViewModelReturnsExpectedNoAccountErrorAlertMessage() throws {
        XCTAssertEqual("No account was found, please create a new account and try again.", systemUnderTest.noAccountErrorAlertMessage)
    }
}

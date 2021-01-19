import XCTest
import SwiftUI
@testable import LoginSwiftUI

class CreateNewAccountViewModelTests: XCTestCase {

    private var systemUnderTest = CreateNewAccountViewModel()
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testCreateNewAccountViewModelReturnsExpectedLightGreyColor() throws {
        XCTAssertEqual(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), systemUnderTest.lightGreyColor)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedCreateAccountTitle() throws {
        XCTAssertEqual("Create Account", systemUnderTest.createAccountTitle)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedUsernameTitle() throws {
        XCTAssertEqual("Username (min 2 letters)", systemUnderTest.usernameTitle)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedPasswordTitle() throws {
        XCTAssertEqual("Password (min 2 letters)", systemUnderTest.passwordTitle)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedCreateButtonTitle() throws {
        XCTAssertEqual("Create!", systemUnderTest.createButtonTitle)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedCountryTitle() throws {
        XCTAssertEqual("Country", systemUnderTest.countryTitle)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedAccountCreatedAlertTitle() throws {
        XCTAssertEqual("Account created!", systemUnderTest.accountCreatedAlertTitle)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedAccountCreatedAlertMessage() throws {
        XCTAssertEqual("Your account has been created, you can use your username and password to login.", systemUnderTest.accountCreatedAlertMessage)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedAccountCreatedAlertButtonTitle() throws {
        XCTAssertEqual("Got it!", systemUnderTest.accountCreatedAlertButtonTitle)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedCountries() throws {
        XCTAssertEqual(["None", "Portugal", "Singapore", "South Africa"], systemUnderTest.countries)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedConfirmPasswordTitle() throws {
        XCTAssertEqual("Confirm Password", systemUnderTest.confirmPasswordTitle)
    }
    
    func testCreateNewAccountViewModelReturnsExpectedUsernameAndPasswordMinimumLength() throws {
        XCTAssertEqual(2, systemUnderTest.usernameAndPasswordMinimumLength)
    }
    
    func testCreateNewAccountViewModelUsernameValidation() throws {
        systemUnderTest.username = ""
        XCTAssertFalse(systemUnderTest.usernameValid)
        
        systemUnderTest.username = "U"
        XCTAssertFalse(systemUnderTest.usernameValid)
        
        systemUnderTest.username = "Us"
        XCTAssertTrue(systemUnderTest.usernameValid)
    }
    
    func testCreateNewAccountViewModelPasswordValidation() throws {
        systemUnderTest.password = ""
        XCTAssertFalse(systemUnderTest.passwordValid)
        
        systemUnderTest.password = "P"
        XCTAssertFalse(systemUnderTest.passwordValid)
        
        systemUnderTest.password = "Pa"
        XCTAssertTrue(systemUnderTest.passwordValid)
    }
    
    func testCreateNewAccountViewModelConfirmPasswordValidation() throws {
        systemUnderTest.password = ""
        systemUnderTest.confirmPassword = ""
        XCTAssertFalse(systemUnderTest.confirmPasswordValid)
        
        systemUnderTest.password = "P"
        systemUnderTest.confirmPassword = "P"
        XCTAssertFalse(systemUnderTest.confirmPasswordValid)
        
        systemUnderTest.password = "Pa"
        systemUnderTest.confirmPassword = "P"
        XCTAssertFalse(systemUnderTest.confirmPasswordValid)
        
        systemUnderTest.password = "Pa"
        systemUnderTest.confirmPassword = "Pa"
        XCTAssertTrue(systemUnderTest.confirmPasswordValid)
    }
    
    func testCreateNewAccountViewModelSaveAccountDetails() throws {
        XCTAssertFalse(systemUnderTest.isShowingAccountCreatedAlert)
        
        systemUnderTest.username = "TestUsername"
        systemUnderTest.password = "TestPassword"
        systemUnderTest.saveAccountDetails()
        
        XCTAssertEqual(UserDefaults.standard.string(forKey: "username"), systemUnderTest.username)
        XCTAssertEqual(UserDefaults.standard.string(forKey: "password"), systemUnderTest.password)
        XCTAssertTrue(systemUnderTest.isShowingAccountCreatedAlert)
    }
}

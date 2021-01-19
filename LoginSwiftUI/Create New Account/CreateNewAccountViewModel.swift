import Foundation
import SwiftUI

protocol CreateNewAccountViewModelProtocol: ViewModelProtocol {
    var lightGreyColor: Color { get }
    var createAccountTitle: String { get }
    var usernameTitle: String { get }
    var passwordTitle: String { get }
    var createButtonTitle: String { get }
    var usernameAndPasswordMinimumLength: Int { get }
    var countryTitle: String { get }
    var countries: [String] { get }
    var accountCreatedAlertTitle: String { get }
    var accountCreatedAlertMessage: String { get }
    var accountCreatedAlertButtonTitle: String { get }
    var confirmPasswordTitle: String { get }
    
    var username: String { get set }
    var usernameValid: Bool { get set }
    var password: String { get set }
    var passwordValid: Bool { get set }
    
    var confirmPassword: String { get set }
    var confirmPasswordValid: Bool { get set }
    var selectedCountryIndex: Int { get set }
    var selectedCountryValid: Bool { get set }
    var isShowingAccountCreatedAlert: Bool { get set }
    
    func saveAccountDetails()
}

class CreateNewAccountViewModel: CreateNewAccountViewModelProtocol {
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let createAccountTitle = "Create Account"
    let usernameTitle = "Username (min 2 letters)"
    let passwordTitle = "Password (min 2 letters)"
    let createButtonTitle = "Create!"
    let usernameAndPasswordMinimumLength = 2
    let countryTitle = "Country"
    let accountCreatedAlertTitle = "Account created!"
    let accountCreatedAlertMessage = "Your account has been created, you can use your username and password to login."
    let accountCreatedAlertButtonTitle = "Got it!"
    let confirmPasswordTitle = "Confirm Password"
    let countries = ["None", "Portugal", "Singapore", "South Africa"]
    
    var passwordValid = false
    var usernameValid = false
    var selectedCountryValid = false
    var confirmPasswordValid = false
    
    @Published var isShowingAccountCreatedAlert = false
    
    @Published var selectedCountryIndex = 0 {
        didSet {
            selectedCountryValid = selectedCountryIndex > 0
        }
    }
    
    @Published var username = "" {
        didSet {
            usernameValid = username.count >= usernameAndPasswordMinimumLength
        }
    }
    
    @Published var password = "" {
        didSet {
            passwordValid = password.count >= usernameAndPasswordMinimumLength
        }
    }
    
    @Published var confirmPassword = "" {
        didSet {
            confirmPasswordValid = confirmPassword.count >= usernameAndPasswordMinimumLength && confirmPassword == password
        }
    }
    
    required init() {
    }
    
    func saveAccountDetails() {
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.set(countries[selectedCountryIndex], forKey: "country")
        isShowingAccountCreatedAlert = true
    }
}

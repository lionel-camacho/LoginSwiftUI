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
    
    var username: String { get set }
    var usernameValid: Bool { get set }
    var password: String { get set }
    var passwordValid: Bool { get set }
    var confirmPasswordTitle: String { get set }
    var confirmPassword: String { get set }
    var confirmPasswordValid: Bool { get set }
    var selectedCountryIndex: Int { get set }
    var selectedCountryValid: Bool { get set }
    var isShowingAlert: Bool { get set }
    
    func saveAccountDetails()
}

class CreateNewAccountViewModel: CreateNewAccountViewModelProtocol {

    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let createAccountTitle: String = "Create Account"
    let usernameTitle: String = "Username (min 2 letters)"
    let passwordTitle: String = "Password (min 2 letters)"
    let createButtonTitle: String = "Create!"
    let usernameAndPasswordMinimumLength: Int = 2
    let countryTitle = "Country"
    let accountCreatedAlertTitle: String = "Account created!"
    let accountCreatedAlertMessage: String = "Your account has been created, you can use your username and password to login."
    let accountCreatedAlertButtonTitle: String = "Got it!"
    
    var passwordValid: Bool = false
    var usernameValid: Bool = false
    var countries: [String] = ["None", "Portugal", "Singapore", "South Africa"]
    var selectedCountryValid: Bool = false
    var confirmPasswordTitle: String = "Confirm Password"
    var confirmPasswordValid: Bool = false
    
    @Published var isShowingAlert: Bool = false
    
    @Published var selectedCountryIndex: Int = 0 {
        didSet {
            selectedCountryValid = selectedCountryIndex > 0
        }
    }
    
    @Published var username: String = "" {
        didSet {
            usernameValid = username.count >= usernameAndPasswordMinimumLength
        }
    }
    
    @Published var password: String = "" {
        didSet {
            passwordValid = password.count >= usernameAndPasswordMinimumLength
        }
    }
    
    @Published var confirmPassword: String = "" {
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
        isShowingAlert = true
    }
}

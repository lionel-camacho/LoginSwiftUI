import Foundation
import SwiftUI

protocol LoginViewModelProtocol: ViewModelProtocol {
    var lightGreyColor: Color { get }
    var welcomeTitle: String { get }
    var appIconName: String { get }
    var usernameTitle: String { get }
    var passwordTitle: String { get }
    var loginButtonTitle: String { get }
    var createNewAccountButtonTitle: String { get }
    var usernameAndPasswordMinimumLength: Int { get }
    var usernameOrPasswordErrorAlertTitle: String { get }
    var usernameOrPasswordErrorAlertMessage: String { get }
    var okButtonTitle: String { get }
    var noAccountErrorAlertTitle: String { get }
    var noAccountErrorAlertMessage: String { get }
    
    var username: String { get set }
    var usernameValid: Bool { get set }
    var password: String { get set }
    var passwordValid: Bool { get set }
    var isShowingUsernameOrPasswordErrorAlert: Bool { get set }
    var isShowingNoAccountErrorAlert: Bool { get set }
    var isAuthenticated: Bool { get set }
    
    func authenticate()
}

class LoginViewModel: LoginViewModelProtocol {
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let welcomeTitle = "Welcome!"
    let appIconName = "Icon"
    let usernameTitle = "Username (min 2 letters)"
    let passwordTitle = "Password (min 2 letters)"
    let loginButtonTitle = "Login"
    let createNewAccountButtonTitle = "Create New Account"
    let networkManager = NetworkManager()
    let usernameAndPasswordMinimumLength = 2
    let usernameOrPasswordErrorAlertTitle = "Username or Password incorrect"
    let usernameOrPasswordErrorAlertMessage = "Your username or password is incorrect, please try again."
    let okButtonTitle = "OK"
    let noAccountErrorAlertTitle = "No account found"
    let noAccountErrorAlertMessage = "No account was found, please create a new account and try again."
    
    var usernameValid = false
    var passwordValid = false
    
    @Published var isShowingUsernameOrPasswordErrorAlert = false
    @Published var isShowingNoAccountErrorAlert = false
    @Published var isAuthenticated = false
    
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
    
    required init() {
    }
    
    func authenticate() {
        if let savedUsername = UserDefaults.standard.string(forKey: "username"), let savedPassword = UserDefaults.standard.string(forKey: "password") {
            if savedUsername == username && savedPassword == password {
                isAuthenticated = true
            } else {
                isShowingUsernameOrPasswordErrorAlert = true
            }
        } else {
            isShowingNoAccountErrorAlert = true
        }
    }
}

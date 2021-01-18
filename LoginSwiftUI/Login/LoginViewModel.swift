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
    var networkManager: NetworkManager { get }
    var usernameAndPasswordMinimumLength: Int { get }
    
    var username: String { get set }
    var usernameValid: Bool { get set }
    var password: String { get set }
    var passwordValid: Bool { get set }
    var usersResponse: [User]? { get set }
    
    func getUsers(completion: @escaping (_ error: String?)->())
}

class LoginViewModel: LoginViewModelProtocol {
   
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let welcomeTitle: String = "Welcome!"
    let appIconName: String = "Icon"
    let usernameTitle: String = "Username (min 2 letters)"
    var usernameValid: Bool = false
    let passwordTitle: String = "Password (min 2 letters)"
    var passwordValid: Bool = false
    let loginButtonTitle: String = "Login"
    let createNewAccountButtonTitle: String = "Create New Account"
    let networkManager: NetworkManager = NetworkManager()
    let usernameAndPasswordMinimumLength: Int = 2
    
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
    
    var usersResponse: [User]? = nil
    
    required init() {
        getUsers { (error) in
        }
    }
    
    func getUsers(completion: @escaping (String?) -> ()) {
        networkManager.getUsers { [weak self] (response, error) in
            if error != nil {
                completion(error)
                return
            }
            if let users = response {
                self?.usersResponse = users
                completion(nil)
                return
            }
            completion(NetworkManager.NetworkResponse.noData.rawValue)
        }
    }
}

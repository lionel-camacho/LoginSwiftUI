import Foundation
import SwiftUI

protocol LoginViewModelProtocol: ViewModelProtocol {
    var lightGreyColor: Color { get }
    var welcomeTitle: String { get }
    var appIconName: String { get }
    var usernameTitle: String { get }
    var passwordTitle: String { get }
    var loginButtonTitle: String { get }
    var networkManager: NetworkManager { get }
    
    var username: String { get set }
    var password: String { get set }
    var usersResponse: [User]? { get set }
    
    func getUsers(completion: @escaping (_ error: String?)->())
}

class LoginViewModel: LoginViewModelProtocol {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let welcomeTitle: String = "Welcome!"
    let appIconName: String = "Icon"
    let usernameTitle: String = "Username"
    let passwordTitle: String = "Password"
    let loginButtonTitle: String = "LOGIN"
    let networkManager: NetworkManager = NetworkManager()
    
    @Published var username: String = ""
    @Published var password: String = ""
    var usersResponse: [User]? = nil
    
    required init() {
        getUsers { (error) in
            //TODO: Implement
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
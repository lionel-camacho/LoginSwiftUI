import Foundation
import SwiftUI

protocol LoginViewModelProtocol: ViewModelProtocol {
    var lightGreyColor: Color { get }
    var welcomeTitle: String { get }
    var appIconName: String { get }
    var usernameTitle: String { get }
    var passwordTitle: String { get }
    var loginButtonTitle: String { get }
    
    var username: String { get set }
    var password: String { get set }
}

class LoginViewModel: LoginViewModelProtocol {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let welcomeTitle: String = "Welcome!"
    let appIconName: String = "Icon"
    let usernameTitle: String = "Username"
    let passwordTitle: String = "Password"
    let loginButtonTitle: String = "LOGIN"
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    required init() {}
}

import Foundation
import SwiftUI

protocol UsersListViewModelProtocol: ViewModelProtocol {
    var networkManager: NetworkManager { get }
    
    var usersResponse: [User]? { get set }
    
    func getUsers(completion: @escaping (_ error: String?)->())
}

class UsersListViewModel: UsersListViewModelProtocol {
    
    let networkManager: NetworkManager = NetworkManager()
    let usernameAndPasswordMinimumLength: Int = 2
    
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

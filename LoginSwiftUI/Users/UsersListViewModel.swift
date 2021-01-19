import Foundation
import SwiftUI

protocol UsersListViewModelProtocol: ViewModelProtocol {
    var networkManager: NetworkManager { get }
    var failedToLoadUsersTitle: String { get }
    var failedToLoadUsersMessage: String { get }
    var retryButtonTitle: String { get }
    var fetchingUsersTitle: String { get }
    var navigationBarTitle: String { get }
    
    var usersResponse: [User] { get set }
    var isLoadingUsers: Bool { get set }
    var errorOccured: Bool { get set }
    
    func getUsers(completion: @escaping (_ error: String?)->())
}

class UsersListViewModel: UsersListViewModelProtocol {
    
    let networkManager = NetworkManager()
    let failedToLoadUsersTitle = "Failed to load users"
    let failedToLoadUsersMessage = "An error occured while attempting to load users, please ensure you are connected to wifi or a mobile connection and try again."
    let retryButtonTitle = "Retry"
    let fetchingUsersTitle = "Fetching users…"
    let navigationBarTitle = "Users"
    
    @Published var usersResponse: [User] = []
    @Published var isLoadingUsers = false
    @Published var errorOccured = false
    
    required init() {
        getUsers { (error) in }
    }
    
    func getUsers(completion: @escaping (String?) -> ()) {
        isLoadingUsers = true
        errorOccured = false
        networkManager.getUsers { [weak self] (response, error) in
            DispatchQueue.main.async { [weak self] in
                self?.isLoadingUsers = false
            }
            if error != nil {
                DispatchQueue.main.async { [weak self] in
                    self?.errorOccured = true
                }
                completion(error)
                return
            }
            if let users = response {
                DispatchQueue.main.async { [weak self] in
                    self?.usersResponse = users
                    self?.errorOccured = false
                }
                completion(nil)
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.errorOccured = true
            }
            completion(NetworkManager.NetworkResponse.noData.rawValue)
        }
    }
}

import Foundation
import SwiftUI

protocol UsersDetailViewModelProtocol: ViewModelProtocol {
    var user: User? { get set }
}

class UsersDetailViewModel: UsersDetailViewModelProtocol {
    
    var user: User? = nil
    
    required init() {
    }
    
    required init(user: User) {
        self.user = user
    }
}

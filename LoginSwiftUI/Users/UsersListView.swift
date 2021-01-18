import SwiftUI

struct UsersListView<ViewModel: UsersListViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {

        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView<UsersListViewModel>()
    }
}

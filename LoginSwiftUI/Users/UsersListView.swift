import SwiftUI

struct UsersListView<ViewModel: UsersListViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Text("Placeholder")
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView<UsersListViewModel>()
    }
}

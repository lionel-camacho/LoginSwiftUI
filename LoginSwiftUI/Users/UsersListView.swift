import SwiftUI

struct UsersListView<ViewModel: UsersListViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            failedToLoadUsersView
                .isHidden(!viewModel.errorOccured)
            ProgressView(viewModel.fetchingUsersTitle)
                .isHidden(!viewModel.isLoadingUsers)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    var failedToLoadUsersView: some View {
        VStack(alignment: .center, spacing: 15) {
            Text(viewModel.failedToLoadUsersTitle)
                .font(.headline)
            Text(viewModel.failedToLoadUsersMessage)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            Button(action: {
                viewModel.getUsers { (error) in
                }
            }) {
                Text(viewModel.retryButtonTitle)
                    .font(.callout)
            }
        } .padding()
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView<UsersListViewModel>()
    }
}

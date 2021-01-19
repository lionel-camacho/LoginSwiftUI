import SwiftUI

struct UsersListView<ViewModel: UsersListViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            failedToLoadUsersView
                .isHidden(!viewModel.errorOccured, remove: !viewModel.errorOccured)
            ProgressView(viewModel.fetchingUsersTitle)
                .isHidden(!viewModel.isLoadingUsers, remove: !viewModel.isLoadingUsers)
            List(viewModel.usersResponse) { user in
                UserCell(user: user)
            }
            .isHidden(viewModel.errorOccured || viewModel.isLoadingUsers, remove: viewModel.errorOccured || viewModel.isLoadingUsers)
        }
        .navigationBarTitle(viewModel.navigationBarTitle)
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

struct UserCell: View {
    let user: User
    var body: some View {
        return NavigationLink(destination: UsersDetailView(viewModel: UsersDetailViewModel(user: user))) {
            VStack(alignment: .leading) {
                Text(user.name)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

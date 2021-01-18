import SwiftUI

struct UsersDetailView<ViewModel: UsersDetailViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {

        }
    }
}

struct UsersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UsersDetailView<UsersDetailViewModel>()
    }
}

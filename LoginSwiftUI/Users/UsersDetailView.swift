import SwiftUI
import MapKit

struct UsersDetailView<ViewModel: UsersDetailViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            contactDetailsView
            addressDetailsView
            companyDetailsView
            Map(coordinateRegion: $viewModel.region,
                showsUserLocation: true,
                annotationItems: [viewModel.marker]) {  marker in
                marker.location
            }
        }
        .navigationBarTitle(viewModel.navigationBarTitle)
        .padding()
    }
    
    private var contactDetailsView: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(viewModel.nameTitle)
                Text(viewModel.user!.name)
            }
            HStack {
                Text(viewModel.usernameTitle)
                Text(viewModel.user!.username)
            }
            HStack {
                Text(viewModel.emailTitle)
                Text(viewModel.user!.email)
            }
            HStack {
                Text(viewModel.phoneTitle)
                Text(viewModel.user!.phone)
            }
            HStack {
                Text(viewModel.websiteTitle)
                Text(viewModel.user!.website.absoluteString)
            }
        }
    }
    
    private var addressDetailsView: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(viewModel.cityTitle)
                Text(viewModel.user!.address.city)
            }
            HStack {
                Text(viewModel.streetTitle)
                Text(viewModel.user!.address.street)
            }
            HStack {
                Text(viewModel.suiteTitle)
                Text(viewModel.user!.address.suite)
            }
            HStack {
                Text(viewModel.zipcodeTitle)
                Text(viewModel.user!.address.zipcode)
            }
        }
    }
    
    private var companyDetailsView: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(viewModel.companyTitle)
                Text(viewModel.user!.company.name)
            }
            HStack(alignment: .top) {
                Text(viewModel.catchPhraseTitle)
                Text(viewModel.user!.company.catchPhrase)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
            HStack {
                Text(viewModel.bsTitle)
                Text(viewModel.user!.company.bs)
            }
        }
    }
}

struct UsersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UsersDetailView<UsersDetailViewModel>()
    }
}

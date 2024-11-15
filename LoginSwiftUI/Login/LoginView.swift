import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                welcomeTitle
                appIcon
                usernameField
                passwordField
                loginButton
                    .disabled(!inputIsValid)
                createNewAccountButton
                NavigationLink(destination: UsersListView<UsersListViewModel>(), isActive: $viewModel.isAuthenticated){}
            }
            .padding()
       
        }
    }
    
    private var inputIsValid: Bool {
        return viewModel.usernameValid && viewModel.passwordValid
    }
    
    private var welcomeTitle: some View {
        Text(viewModel.welcomeTitle)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
    
    private var appIcon: some View {
        Image(viewModel.appIconName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80, height: 80)
            .padding(.bottom, 20)
    }
    
    private var usernameField: some View {
        TextField(viewModel.usernameTitle, text: $viewModel.username)
            .padding()
            .background(viewModel.lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
    
    private var passwordField: some View {
        SecureField(viewModel.passwordTitle, text: $viewModel.password)
            .padding()
            .background(viewModel.lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .textContentType(.oneTimeCode)
    }
    
    private var loginButton: some View {
        Button(action: {viewModel.authenticate()}) {
            Text(viewModel.loginButtonTitle)
                .font(.headline)
                .foregroundColor(loginButtonForegroundColor)
                .padding()
                .frame(width: 220, height: 40)
                .background(loginButtonBackgroundColor)
                .cornerRadius(15.0)
        }
        .alert(isPresented: $viewModel.isShowingUsernameOrPasswordErrorAlert) {
            Alert(title: Text(viewModel.usernameOrPasswordErrorAlertTitle), message: Text(viewModel.usernameOrPasswordErrorAlertMessage), dismissButton: .default(Text(viewModel.okButtonTitle)))
        }
        .alert(isPresented: $viewModel.isShowingNoAccountErrorAlert) {
            Alert(title: Text(viewModel.noAccountErrorAlertTitle), message: Text(viewModel.noAccountErrorAlertMessage), dismissButton: .default(Text(viewModel.okButtonTitle)))
        }
    }
    
    private var createNewAccountButton: some View {
        NavigationLink(destination: CreateNewAccountView<CreateNewAccountViewModel>()) {
            Text(viewModel.createNewAccountButtonTitle)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 40)
                .background(Color.green)
                .cornerRadius(15.0)
        }
    }
    
    private var loginButtonBackgroundColor: Color {
        if !inputIsValid {
            return viewModel.lightGreyColor
        }
        return .green
    }
    
    private var loginButtonForegroundColor: Color {
        if !inputIsValid {
            return .gray
        }
        return .white
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView<LoginViewModel>()
    }
}

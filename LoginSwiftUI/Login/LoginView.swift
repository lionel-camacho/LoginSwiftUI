import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            welcomeTitle
            appIcon
            
            usernameField
            passwordField
            
            loginButton
        }
        .padding()
    }
    
    private var welcomeTitle: some View {
        Text(viewModel.welcomeTitle)
            .font(.largeTitle)
            .fontWeight(.semibold)
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
    }
    
    private var appIcon: some View {
        Image(viewModel.appIconName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .padding(.bottom, 75)
    }
    
    private var loginButton: some View {
        Button(action: {print("Button tapped")}) {
            Text(viewModel.loginButtonTitle)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView<LoginViewModel>()
    }
}

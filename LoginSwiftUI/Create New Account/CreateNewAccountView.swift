import SwiftUI

struct CreateNewAccountView<ViewModel: CreateNewAccountViewModelProtocol>: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            createAccountTitle
            usernameField
            passwordField
            confirmPasswordField
            countryPicker
            createButton
                .disabled(!inputIsValid)
        }
        .padding()
    }
    
    private var inputIsValid: Bool {
        return viewModel.usernameValid && viewModel.passwordValid && viewModel.confirmPasswordValid && viewModel.selectedCountryValid
    }
    
    private var createAccountTitle: some View {
        Text(viewModel.createAccountTitle)
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
    
    private var confirmPasswordField: some View {
        SecureField(viewModel.confirmPasswordTitle, text: $viewModel.confirmPassword)
            .padding()
            .background(viewModel.lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
    
    private var countryPicker: some View {
        VStack {
            Text(viewModel.countryTitle)
            Picker(selection: $viewModel.selectedCountryIndex, label: Text(viewModel.countryTitle)) {
                ForEach(0 ..< viewModel.countries.count) {
                    Text(self.viewModel.countries[$0]).tag($0)
                }
            }
            .frame(maxHeight: 150)
        }
    }
    
    private var createButton: some View {
        Button(action: {print("Button tapped")}) {
            Text(viewModel.createButtonTitle)
                .font(.headline)
                .foregroundColor(createButtonForegroundColor)
                .padding()
                .frame(width: 220, height: 40)
                .background(createButtonBackgroundColor)
                .cornerRadius(15.0)
        }
    }
    
    private var createButtonBackgroundColor: Color {
        if !inputIsValid {
            return viewModel.lightGreyColor
        }
        return .green
    }
    
    private var createButtonForegroundColor: Color {
        if !inputIsValid {
            return .gray
        }
        return .white
    }
}

struct CreateNewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewAccountView<CreateNewAccountViewModel>()
    }
}

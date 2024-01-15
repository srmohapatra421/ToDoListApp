//
//  LoginVIew.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI

struct LoginVIew: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                
                // Header
                HeaderView(title: "To Do List", subTitel: "Get things done", rotation: 15, background: Color.pink)
                
                //Login Form
                Form{
                    TextField("Email id",text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    if(!viewModel.errorMessageEmail.isEmpty){
                        Text(viewModel.errorMessageEmail).foregroundColor(.red)
                    }
                    SecureField("Password",text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    if(!viewModel.errorMessagePassword.isEmpty){
                        Text(viewModel.errorMessagePassword).foregroundColor(.red)
                    }
                    TLButton(title: "Log in", backgroung: .blue, action: {viewModel.login()}).padding()
                }.offset(y:-50  )
                
                VStack{
                    Text("New arround here?")
                    NavigationLink("Create account", destination: RegisterView())

                }.padding(.bottom,30)
                
                
                //SignUp Btn
                Spacer()
            }
        }
    }
}

#Preview {
    LoginVIew()
}

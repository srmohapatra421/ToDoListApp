//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI

struct RegisterView: View {
  
    
    @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
            
                // Header
                HeaderView(title: "Register", subTitel: "Start organizing todos", rotation: -15, background: Color.orange)
                //Body
                Form{
                    
                    if(!viewModel.errorMessage.isEmpty){
                        Text(viewModel.errorMessage).foregroundColor(.red)
                    }
                    
                    TextField("Full Name",text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                    
                    TextField("Email id",text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password",text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Register", backgroung: .green, action: {viewModel.register()}).padding()

                }.offset(y:-50  )
                
                //Fotter
                Spacer()
                
            }
        }
    }
}

#Preview {
    RegisterView()
}

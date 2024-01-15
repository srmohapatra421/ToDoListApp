//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessageEmail = ""
    @Published var errorMessagePassword = ""
    
    init(){
        
    }
    
    func login(){

        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
       
        print("Login ")
        
    }
   private func validate() -> Bool{
        errorMessagePassword=""
        errorMessageEmail = ""
//        guard !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespaces).isEmpty else{
//            errorMessageEmail="Please add email id"
//            errorMessagePassword="Please add password"
//            return
//        }
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessagePassword = ""
            errorMessageEmail="Please add email id"
            return false
        }
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessagePassword="Please add password"
            errorMessageEmail = ""
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessageEmail="Please add valid email id"
            return false
        }
        return true
    }
}

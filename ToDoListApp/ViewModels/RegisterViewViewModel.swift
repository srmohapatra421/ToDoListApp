//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func register(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){
            result,error in
            guard let userID = result?.user.uid else{
                return
            }
            self.insertUserRecord(id: userID)
        }
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDictionary())
        
        
    }
   private func validate()->Bool{
       
       guard !name.trimmingCharacters(in: .whitespaces).isEmpty ,
        !email.trimmingCharacters(in: .whitespaces).isEmpty ,
             !password.trimmingCharacters(in: .whitespaces).isEmpty else{
           errorMessage = "Add valid data."
           return false
       }
       guard email.contains("@") && email.contains(".") else{
           errorMessage="Please add valid email id."
           return false
       }
       guard password.count>=6 else{
           errorMessage="Password must be 6 digit"
           return false
       }
       return true
        
    }
}

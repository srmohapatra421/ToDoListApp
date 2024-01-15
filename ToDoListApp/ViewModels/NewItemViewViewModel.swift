//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewViewModel: ObservableObject{
    
    @Published var titel : String=""
    @Published var taskName : String=""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init() {
       
    }
    func save(){
        guard canSave else{
            return
        }
        //Get current user
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id:newId, title: titel, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).collection("todos").document(newId).setData(newItem.asDictionary())
        
        
    }
    
    var canSave : Bool{
        guard !titel.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate>=Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
    
  
   
    
}

//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
class ToDoListItemViewViewModel: ObservableObject{
    
    @Published var currentUserID : String=""
    
    
    init() {
       
    }
    func  toggleIsDone(item:ToDoListItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
        
    }
    
  
   
    
}

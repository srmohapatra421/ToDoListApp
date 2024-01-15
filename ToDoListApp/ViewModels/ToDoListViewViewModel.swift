//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore

class ToDoListViewModel: ObservableObject{
    
    @Published var currentUserID : String=""
    @Published var showingNewItemView = false
    private let userId:String
    
    
    init(userId:String) {
        
        self.userId=userId
    }
    
    /// Delete todo list item
    /// - Parameter id: item id to todo list
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
    

   
    
}

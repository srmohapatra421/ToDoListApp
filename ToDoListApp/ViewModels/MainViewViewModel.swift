//
//  MainViewViewModel.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject{
    
    @Published var currentUserID : String=""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {
            [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    public var isSignedin:Bool {
        return Auth.auth().currentUser != nil
    }
    
}

//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 11/01/24.
//
import FirebaseCore
import SwiftUI


@main
struct ToDoListAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

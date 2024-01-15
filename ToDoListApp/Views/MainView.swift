//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 11/01/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
       
        if viewModel.isSignedin ,!viewModel.currentUserID.isEmpty{
            TabView{
                ToDoListView(userId:viewModel.currentUserID).tabItem { Label("Home",systemImage: "house") }
                ProfileView().tabItem { Label("Profile",systemImage: "person.circle") }
            }
        }else{
            LoginVIew()
        }
      
        
    }
}

#Preview {
    MainView()
}

//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    //Avatar
                      Image(systemName: "person.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).frame(width: 125,height: 125).padding()
                      VStack(alignment: .leading) {
                          HStack{
                              Text("Name: ").bold()
                              Text(user.name)
                          }
                          HStack{
                              Text("Email id: ").bold()
                              Text(user.email)
                          }
                          HStack{
                              Text("Member since: ").bold()
                              Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .standard))")
                          }
                         
                         
                      }.padding()
                      
                      Button("Sign Out") {
                          viewModel.logOut()
                      }.tint(.red).padding()
                      Spacer()
                }else{
                    Text("Loading profile data...")
                }
            }.navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}

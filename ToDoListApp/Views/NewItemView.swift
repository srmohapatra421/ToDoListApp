//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented:Bool

    var body: some View {
        VStack{
            Text("Add new item").font(.system(size: 30).bold()).padding()
            
            Form{
                TextField("Titel",text: $viewModel.titel)
//                TextField("Task",text: $viewModel.taskName)
                DatePicker("Due date",selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", backgroung: .blue, action: {
                    
                  
                    
                   if viewModel.canSave {
                       viewModel.save()
                       newItemPresented = false
                   }else{
                       viewModel.showAlert=true
                   }
                }).padding()
            }.alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),message: Text("Please add all imformetion."))
            }
            
        }
    }
}

#Preview {
    NewItemView (
        newItemPresented: Binding (get: { return true }, set: { _ in }))
}

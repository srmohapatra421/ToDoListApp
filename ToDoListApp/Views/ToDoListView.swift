//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewModel
    
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
        
    }

    var body: some View {
        
        NavigationView{
            
            VStack{
                List(items){
                    item in
                    ToDoListItemVIew(item: item).swipeActions{
                       
                        Button("Delete"){
                            viewModel.delete(id: item.id)
                        }.tint(.red)
                        
                    }
                }.listStyle(PlainListStyle())
                

            }
            .navigationTitle("To Do List")
            .toolbar { Button {
                viewModel.showingNewItemView = true
                // Action
            }label: { Image (systemName: "plus")
            }
            }.sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
        
      
        
    }
}

#Preview {
    ToDoListView(userId: "RJQaIH7JUtTeSp0f06YjlpNiQMx1")
}

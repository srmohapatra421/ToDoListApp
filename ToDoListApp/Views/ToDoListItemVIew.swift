//
//  ToDoListItemVIews.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI

struct ToDoListItemVIew: View {
    
    @StateObject var viewModel = ToDoListItemViewViewModel()

    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .standard))").font(.footnote)
            }
            Spacer()
            Button{
                viewModel.toggleIsDone(item:item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
            
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View { 
        ToDoListItemVIew(item: .init(id: "wqwe", title: "qweqwe", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
    }
}

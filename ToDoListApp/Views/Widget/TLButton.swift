//
//  TLButton.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let backgroung:Color
    let action:()->Void
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(backgroung)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Title", backgroung: .blue, action: {})
}

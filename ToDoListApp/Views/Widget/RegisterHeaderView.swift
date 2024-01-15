//
//  RegisterHeaderView.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI

struct RegisterHeaderView: View {
    var body: some View {
        //Header
        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(Color.orange).rotationEffect(Angle(degrees: -15))
            VStack{
                Text("Register")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .bold()
                Text("Start organizing todos")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                    .bold()
            }.padding(.top,10)
        }.frame(width: UIScreen.main.bounds.width*3,height: 250)
            .offset(y:-100  )
       
        
        
      
    }
}

#Preview {
    RegisterHeaderView()
}

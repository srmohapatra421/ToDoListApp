//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Soumya Ranjan Mohapatra on 12/01/24.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subTitel:String
    let rotation:Double
    let background:Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(background).rotationEffect(Angle(degrees: rotation))
            VStack{
                Text(title)
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subTitel)
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                    .bold()
            }.padding(.top,60)
        }.frame(width: UIScreen.main.bounds.width*3,height: 350)
            .offset(y:-150  )
    }
}

#Preview {
    HeaderView(title: "Title", subTitel: "Subtitle", rotation: 15, background: .blue)
}

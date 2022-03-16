//
//  Shapes.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 15/03/2022.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: 200, height: 100, alignment: .center)
                    .transition(.move(edge: .bottom))
                    //.animation(.easeInOut, value: wideShapes)
            }
            
            RoundedRectangle(cornerRadius: 20.0)
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: wideShapes ? 200 : 100, height: 100, alignment: .center)
                //.animation(.easeInOut, value: wideShapes)
            
            Button(action: {
                withAnimation {
                    wideShapes.toggle()
                }
            }) {
                Text("Animate")
            }
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
            .previewInterfaceOrientation(.portrait)
    }
}

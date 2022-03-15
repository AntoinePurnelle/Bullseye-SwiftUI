//
//  Shapes.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 15/03/2022.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20.0)
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200, height: 100, alignment: .center)
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

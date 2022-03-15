//
//  TextViews.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 11/03/2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var number: Int
    
    var body: some View {
        Text(String(number))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var number: Int
    
    var body: some View {
        Text(String(number))
            .bold()
            .foregroundColor(Color("TextColor"))
    }
    
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(number: 42)
            SliderLabelText(number: 100)
        }
    }
}

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
            .foregroundColor(.text)
    }
}

struct BigNumberText: View {
    var number: Int
    
    var body: some View {
        Text(String(number))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.text)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .fontWeight(.bold)
            .bold()
            .font(.caption)
            .kerning(1.5)
            .foregroundColor(.text)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        let lineHeight = 34.3-15
        
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(lineHeight)
            .foregroundColor(Color.text)
            .padding(.vertical, lineHeight / 2)
            
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .cornerRadius(12)
        
    }
}

struct SliderLabelText: View {
    var number: Int
    
    var body: some View {
        Text(String(number))
            .bold()
            .foregroundColor(.text)
            .frame(width: 35)
        
    }
    
}

struct TextsPreviewView: View {
    var body: some View {
        VStack(spacing: 16) {
            InstructionText(text: "Instructions")
            BigNumberText(number: 42)
            SliderLabelText(number: 100)
            LabelText(text: "Label")
            BodyText(text: """
                     Body text 555
                     Second line
                    """)
            ButtonText(text: "Button text")
        }
        .padding()
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextsPreviewView()
        TextsPreviewView()
            .preferredColorScheme(.dark)
    }
}

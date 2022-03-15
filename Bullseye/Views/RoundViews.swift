//
//  RoundViews.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 15/03/2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(.text)
            .frame(width: 56.0, height: 56.0, alignment: .center)
            .overlay(
                Circle().strokeBorder(Color.buttonStroke, lineWidth: 2)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(.buttonFilledText)
            .frame(width: 56.0, height: 56.0, alignment: .center)
            .background(
                Circle().fill(Color.buttonFilledBackground)
            )
    }
}

struct RoundRectTextView: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .font(.title3)
            .kerning(-0.2)
            .bold()
            .foregroundColor(.text)
            .frame(width: 68, height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: 21).strokeBorder(Color.buttonStroke, lineWidth: 2)
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(score: 999)
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}

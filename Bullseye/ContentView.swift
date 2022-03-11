//
//  ContentView.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 11/03/2022.
//
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("89")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                    .opacity(0.5)
                Slider(value: .constant(50), in: 1.0...100.0)
                Text("100")
                    .bold()
                    .opacity(0.5)
            }
            Button(action: {
                print("Hello SwiftUI")
            }) {
                Text("Hit me")
            }
        }.padding()
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
    }

//    #if DEBUG
//        @objc class func injected() {
//            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
//            windowScene?.windows.first?.rootViewController =
//                UIHostingController(rootView: ContentView_Previews.previews)
//        }
//    #endif
}

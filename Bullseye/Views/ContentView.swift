//
//  ContentView.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 11/03/2022.
//
//

import SwiftUI

struct ContentView: View {

    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()

    var body: some View {
        ZStack {
            Color("BackgroundColor")
            VStack {
                Text("🎯🎯🎯\nPut the bullseye as close as you can to".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)

                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)

                HStack {
                    Text("1")
                        .bold()
                        .opacity(0.5)

                    Slider(value: $sliderValue, in: 1.0...100.0)

                    Text("100")
                        .bold()
                        .opacity(0.5)
                }
                    .padding()

                Button(action: {
                    print("Hello SwiftUI")
                    alertIsVisible = true
                }) {
                    Text("Hit me".uppercased())
                        .bold()
                        .font(.title3)
                }
                    .padding(20.0)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(21.0)
                    .alert("Hello there!", isPresented: $alertIsVisible) {
                    Button("Awesome!") {
                    }
                } message: {
                    let roundedValue = Int(sliderValue.rounded())

                    Text("""
                         The slider's value is \(roundedValue)
                         You scored \(game.points(for: roundedValue))
                         """)
                }
            }
                .padding()
        }
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

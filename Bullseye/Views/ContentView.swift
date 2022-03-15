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
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            }
            .padding()
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: """
                    🎯🎯🎯
                    Put the bullseye as close as you can to
                    """)
                .padding(.horizontal, 30.0)
            BigNumberText(number: game.target)
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(number: 1)
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(number: 100)
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            print("Hello SwiftUI")
            alertIsVisible = true
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
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
    
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}

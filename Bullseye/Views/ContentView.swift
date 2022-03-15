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
            BackgroundView(game: $game)
            VStack(spacing: 100) {
                InstructionsView(game: $game)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            }
            
            SliderView(sliderValue: $sliderValue)
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
        let roundedValue = Int(sliderValue.rounded())
        
        Button(action: {
            alertIsVisible = true
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(ZStack {
            Color.buttonBackground
            LinearGradient(gradient: Gradient(colors: [.white.opacity(0.3), .clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(.white, lineWidth: 2.0)
        )
        .alert("Hello there!", isPresented: $alertIsVisible) {
            Button("Awesome!") {
                game.startNewRound(points: game.points(for: roundedValue))
            }
        } message: {
            Text("""
                 The target value is \(game.target)
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

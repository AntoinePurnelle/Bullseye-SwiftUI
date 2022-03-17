//
//  PointsView.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 16/03/2022.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(for: roundedValue)
        
        VStack {
            InstructionText(text: "The slider value is")
                .padding(.bottom, 13)
            BigNumberText(number: roundedValue)
                .padding(.bottom, 5)
            BodyText(text: """
                 You scored \(points) points
                 🎉🎉🎉
                 """)
            .padding(.bottom, 5)
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color.background)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
    }
}

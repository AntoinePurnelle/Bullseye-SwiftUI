//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 15/03/2022.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
            .padding()
            .background(
            Color.background
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct TopView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct BottomView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            ScoreView(label: "Score", score: game.score)
            Spacer()
            ScoreView(label: "Round", score: game.round)
        }
    }
}

struct ScoreView: View {
    var label: String
    var score: Int
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: label)
            RoundRectTextView(score: score)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}

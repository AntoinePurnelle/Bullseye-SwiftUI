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
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderBoardIsShowing = false
    
    var body: some View {
        HStack {
            Button (action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                leaderBoardIsShowing = true
            }) {
                RoundedImageViewFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderBoardIsShowing, onDismiss: {}, content: {
                LeaderboardView(leaderboardIsShowing: $leaderBoardIsShowing, game: $game)
            })
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

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            let opacity = colorScheme == .dark ? 0.1 : 0.3
            
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(colors: [.backgroundCircles.opacity(opacity), .backgroundCircles.opacity(0)], center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
            
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

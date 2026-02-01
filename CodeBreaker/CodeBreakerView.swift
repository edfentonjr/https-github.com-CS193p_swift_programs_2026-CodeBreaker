//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by FENTON, EDWARD F on 1/12/26.
//

import SwiftUI



struct CodeBreakerView: View {
    // MARK: Data Owned by Me
    @State var game = CodeBreaker(pegChoices: [.brown, .yellow, .orange, . black, .green])
    @State var selection: Int = 0
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            view(for: game.masterCode)
            ScrollView {
                if !game.isOver {
                    view(for:game.guess)
                }
                
                
                ForEach(game.attempts.indices.reversed(), id:  \.self) { index in
                    view(for: game.attempts[index])
                }
            }
            PegChoser(choices: game.pegChoices) { peg in
                game.setGuessPeg(peg, at: selection)
                selection = (selection + 1) % game.masterCode.pegs.count
            }
        }
        .padding()
    }
    
        
    var guessButton: some View {
        Button("Guess") {
            withAnimation {
                game.attemptGuess()
                selection = 0
               
            }
        }
        .font(.system(size:GuessButton.maxiumFontSize))
        .minimumScaleFactor(GuessButton.scaleFactor)
    }
    
    func view(for code: Code) -> some View {
        HStack {
            CodeView(code: code, selection: $selection)
            Color.clear.aspectRatio(1, contentMode: .fit)
                .overlay {
                    if let matches = code.matches {
                        MatchMakers(matches: matches)
                    } else {
                        
                        if code.kind == .guess {
                            guessButton
                        }
                    }
                    
                }
        }
    }
        struct GuessButton {
            static let minimumFontSize: CGFloat = 8
            static let maxiumFontSize: CGFloat = 80
            static let scaleFactor = minimumFontSize / maxiumFontSize
        }
    
    
}
    extension Color {
        static func gray(_ brightness: CGFloat) -> Color {
            return Color(hue: 148/360, saturation: 0, brightness: brightness)
        }
}

#Preview {
    CodeBreakerView()
}

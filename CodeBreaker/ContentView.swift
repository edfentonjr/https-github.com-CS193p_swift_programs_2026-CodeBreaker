//
//  ContentView.swift
//  CodeBreaker
//
//  Created by FENTON, EDWARD F on 1/12/26.
//

import SwiftUI



struct ContentView: View {
    
    
    var body: some View {
        VStack {
            pegs(colors: [.red, .green, .green, .yellow, .blue, .red])
            pegs(colors: [.red, .blue, .green, .red, .orange, .purple])
            pegs(colors: [.red, .green, .green, .yellow, .yellow, .green])
            pegs(colors: [.red, .green, .blue, .yellow, .purple, .red])
            pegs(colors: [.red, .blue, .green, .yellow, .red, .orange])
            pegs(colors: [.red, .green, .blue, .blue, .brown, .cyan])
            
        }
        .padding()
    }
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self) { index in
               RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colors[index])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            MatchMakers(matches: [.exact, .inexact, .nomatch])
            
        }
    }
    
}

#Preview {
    ContentView()
}

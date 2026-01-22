//
//  MatchMakers.swift
//  CodeBreaker
//
//  Created by FENTON, EDWARD F on 1/16/26.
//

import SwiftUI



struct MatchMakersPerview: View {
    var matches: [Match]
    
    var body: some View {
        
        HStack {
            dummyPegs(count: matches.count)
            MatchMakers(matches: matches)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        frame(height: 40)
            .padding()
    }
    func dummyPegs(count:Int) -> some View {
        return ForEach(0..<count, id: \.self) { _ in
            Circle()
        }
    }
}

#Preview {
    
    MatchMakers(matches: [.exact, .inexact, .nomatch])
    
}

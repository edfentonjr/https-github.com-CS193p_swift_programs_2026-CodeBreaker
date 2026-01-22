//
//  MatchMakers.swift
//  CodeBreaker
//
//  Created by FENTON, EDWARD F on 1/16/26.
//

import SwiftUI


struct MatchMakersView: View {
    var matches: [Match]
    
    var body: some View {
       
        HStack (alignment: .top) {
            VStack {
                matchMarkers(peg: 0)
                matchMarkers(peg: 1)
            }
            VStack {
                matchMarkers(peg: 2)
                if matches.count > 3{
                    matchMarkers(peg: 3)
            }
        }
            VStack {
                if matches.count > 4 {
                  matchMarkers(peg: 4)
                }
            }
                    VStack {
                        if matches.count > 5 {
                           matchMarkers(peg: 5)
                        }
                    }
                }
            }
           
    func matchMarkers(peg: Int) -> some View {
        let exactCount = matches.count { $0 == .exact}
        let foundCount = matches.count { $0 != .nomatch}
        
        return Circle()
            
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2).aspectRatio(1, contentMode: .fit)
            
          
    }
}

#Preview {
    MatchMakers(matches: [.exact, .inexact, .nomatch])
    MatchMakers(matches: [.exact, .inexact, .exact])
    MatchMakers(matches: [.exact, .inexact, .inexact])
    
}

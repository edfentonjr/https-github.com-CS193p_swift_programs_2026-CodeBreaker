//
//  MatchMakers.swift
//  CodeBreaker
//
//  Created by FENTON, EDWARD F on 1/16/26.
//

import SwiftUI

enum Match{
    case nomatch
    case exact
    case inexact
}

struct MatchMakers: View {
    var matches: [Match]
    
    var body: some View {
        
        HStack {
            VStack {
                matchMarkers(peg: 0)
                matchMarkers(peg: 1)
                
                
            }
            VStack {
                
                matchMarkers(peg: 2)
                matchMarkers(peg: 3)
              
            }
        }
    }
        func matchMarkers(peg: Int) -> some View {
            let exactCount = matches.count { $0 == .exact}
            let foundCount = matches.count { $0 != .nomatch}
          
            
            return ZStack {
                // Base circle fill for exact matches
                Circle()
                    .fill(exactCount > peg ? Color.primary : Color.clear)

                // Outline for any found (exact or inexact)
                Circle()
                    .stroke(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)

                // Additional red outline for inexact
                Circle()
                    .stroke(exactCount > peg ? Color.red : Color.clear, lineWidth: 2)
            }
            .aspectRatio(1, contentMode: .fit)
            
        }
    }


#Preview {
    MatchMakers(matches: [.exact, .inexact, .nomatch, .exact])
   
}


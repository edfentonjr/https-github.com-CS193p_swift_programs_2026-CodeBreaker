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
        
        VStack {
            HStack {
                matchMarkers(peg: 0)
                matchMarkers(peg: 1)
                matchMarkers(peg: 2)
                
                
            }
            HStack {
                
                matchMarkers(peg: 3)
                matchMarkers(peg: 4)
                matchMarkers(peg: 5)
              
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
    MatchMakers(matches: [.exact, .exact, .exact, .exact, .exact, .exact])
   
}


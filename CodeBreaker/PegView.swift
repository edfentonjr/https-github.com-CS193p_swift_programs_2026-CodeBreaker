//
//  PegView.swift
//  CodeBreaker
//
//  Created by FENTON, EDWARD F on 1/27/26.
//

import SwiftUI

struct PegView: View {
    
    //MARK: Data In
    
    let peg: Peg
    
    //MARK: - BODY
    
    let pegShape =  Circle()
    
    var body: some View {
        pegShape
             .overlay {
                 if peg == Code.missingPeg {
                    pegShape
                         .strokeBorder(Color.gray)
                 }
             }
         .contentShape(pegShape)
              .aspectRatio(contentMode: .fit)
              .foregroundStyle(peg)
    }
}

#Preview {
    PegView(peg: .blue)
        .padding()
}

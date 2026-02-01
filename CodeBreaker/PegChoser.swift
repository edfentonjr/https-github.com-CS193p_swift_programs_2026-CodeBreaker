//
//  PegChoser.swift
//  CodeBreaker
//
//  Created by FENTON, EDWARD F on 1/31/26.
//

import SwiftUI

struct PegChoser: View {
    
    //MARK: Data In
    let choices: [Peg]
    
    //MARK: Data Out Function
    let onChoose: ((Peg) -> Void)?
    
    var body: some View {
        HStack {
            ForEach(choices, id: \.self) { peg in
                Button {
                   onChoose?(peg)
                } label: {
                    PegView(peg: peg)
                }
            }
        }
    }
}

//#Preview {
//    PegChoser()
//}

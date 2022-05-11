//
//  TestTestTestView.swift
//  Set
//
//  Created by Maxim Sychenko on 05.04.2022.
//

import SwiftUI

struct TestTestTestView: View {
    
    enum Shapes {
        case diamond, oval, squiggle
    }
    
    let shape: Shapes

        var body: some View {
            VStack{
                headerSection
                    
            }
        }
    
    @ViewBuilder private var headerSection: some View {
        
        switch shape {
        case .diamond: viewDiamond
        case .squiggle: viewSquiggle
        case .oval: viewOval
        }
    }
    
    private var viewDiamond: some View {
        Diamond()

    }
    private var viewSquiggle: some View {
        Squiggle()

    }
    private var viewOval: some View {
        Capsule()

    }
}

struct TestTestTestView_Previews: PreviewProvider {
    static var previews: some View {
        TestTestTestView(shape: .oval)
    }
}

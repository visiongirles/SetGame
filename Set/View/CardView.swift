//
//  CardView.swift
//  Set
//
//  Created by Kate Sychenko on 01.04.2022.
//

import Foundation
import SwiftUI
import UIKit

struct CardView: View {
    
    let card: Card
    
    private func getColor(from color: Theme.ColorType) -> Color {
        switch color {
        case .red: return Color.red
        case .blue: return Color.blue
        case .green: return Color.green
        }
    }
    
    private func getShading(from shade: Theme.ShadingType) -> Double {
        switch shade {
        case .solid: return 1.0
        case .striped: return 0.5
        case .open: return 0
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke()
                .foregroundColor(Color.black)
                .cornerRadius(1)
            
            shapeView
                .padding(1)
            
        }
    }
    
    @ViewBuilder private var shapeView: some View {
        switch card.shape {
        case .diamond: diamondView
        case .squiggle: squiggleView
        case .oval: ovalView
        }
    }
    
    @ViewBuilder private var diamondView: some View {
        VStack(spacing: 2) {
            ForEach(0..<card.numberOfShape.rawValue) {_ in
                switch card.shading {
                case .open:
                    Diamond()
                        .stroke().opacity(card.shading == . open ? 1 : 0)
                        .frame(minWidth: 20, maxWidth: 25, minHeight: 10, maxHeight: 10, alignment: .center)
                default:
                        Diamond()
                            .fill().opacity(getShading(from: card.shading))
                          //  .stroke().opacity(card.shading == . open ? 1 : 0)

                        .frame(minWidth: 20, maxWidth: 25, minHeight: 10, maxHeight: 10, alignment: .center)
                }
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .foregroundColor(getColor(from: card.color))
        
    }
    
    @ViewBuilder private var squiggleView: some View {
        VStack(spacing: 0) {
            ForEach(0..<card.numberOfShape.rawValue) {_ in
                if card.shading == .open {
                    Squiggle()
                        .stroke()
                        .frame(minWidth: 20, maxWidth: 25, minHeight: 10, maxHeight: 10, alignment: .center)
                } else {
                    Squiggle()
                        .fill()
                        .opacity(getShading(from: card.shading))
                        .frame(minWidth: 20, maxWidth: 25, minHeight: 10, maxHeight: 10, alignment: .center)
                }
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .foregroundColor(getColor(from: card.color))
    }
    
    @ViewBuilder private var ovalView: some View {
        VStack(spacing: 2) {
            ForEach(0..<card.numberOfShape.rawValue) {_ in
                if card.shading == .open {
                    Capsule()
                        .stroke()
                        .frame(minWidth: 20, maxWidth: 25, minHeight: 10, maxHeight: 10, alignment: .center)
                } else {
                    Capsule()
                        .fill()
                        .opacity(getShading(from: card.shading))
                        .frame(minWidth: 20, maxWidth: 25, minHeight: 10, maxHeight: 10, alignment: .center)
                }
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .foregroundColor(getColor(from: card.color))
    }
    
    @ViewBuilder private func createCard(of color: Theme.ColorType, of shape: Theme.ShapeType, of shading: Theme.ShadingType, of numberOfShades: Theme.NumberOfShapeType) -> some View {
        switch card.shape {
        case .diamond: diamondView
        case .squiggle: squiggleView
        case .oval: ovalView
        }
        VStack {
            
        }
    }
}




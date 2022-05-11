//
//  ClassicSetCardGameView.swift
//  Set
//
//  Created by Kate Sychenko on 01.04.2022.
//
import Foundation
import SwiftUI

struct ClassicSetCardGameView: View {
    @ObservedObject var viewModel: ClassicSetCardGameViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                headerView
                    .padding(.bottom, 0)
                
                gameView
                    .padding(.top, 0)
                    .padding(.leading)
                    .padding(.trailing)
                
                
                Spacer()
                bottomView
                    .padding(.horizontal, 5)
                    .padding(.bottom, 10)
                
            }
//            HStack {
//                deckBody
//                dealtBody
//            }
        }
    }
}

struct ClassicSetCardGameView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModelPreview = ClassicSetCardGameViewModel()
        ClassicSetCardGameView(viewModel: viewModelPreview)
    }
}


extension ClassicSetCardGameView {
    
    private var headerView: some View {
        Text("Classic Set Game")
            .font(.headline)
    }
    
    private var gameView: some View {
        AspectVGrid(items: viewModel.deck, aspectRatio: 2/3) {
            card in
            CardView(card: card)
                .border(.gray, width: card.isSelected ? 5 : 0)
                .padding(1)
                .onTapGesture {
                    viewModel.select(card)
                }
        }
    }
    
    private var bottomView: some View {
        
        HStack(alignment: .center, spacing: 10) {
            Button {
                viewModel.addTheMoreCards()
            } label: { Text("Add 3 More Cards") }
            .buttonStyle(.borderedProminent)
            
            Button {
                viewModel.newGame()
            } label: { Text("New Game") }
            .buttonStyle(.borderedProminent)
        }
    }
    
//    private var deckBody: some View {
//        Text("Cool")
//    }
//
//    private var dealtBody: some View {
//        Text("Cool")
//    }
}

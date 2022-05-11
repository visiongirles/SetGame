//
//  ClassicSetCardGameViewModel.swift
//  Set
//
//  Created by Kate Sychenko on 01.04.2022.
//

import Foundation
import SwiftUI

//struct CardViewModel {
//    private let card: Card
//    private let model: SetCardGame
//
//    init(card: Card, model: SetCardGame) {
//        self.card = card
//        self.model = model
//    }
//
//
//    public func isSelected() {
//        return model.IsCardSelected(self.card);
//    }
//}

class ClassicSetCardGameViewModel: ObservableObject {
    
    @Published var model: SetCardGame
    
    var deck: [Card] {
        model.deck.filter({ $0.isPresented })
    }
    
    private(set) var theme: Theme = {
        Theme.classicTheme
    }()
    
    init() {
        self.model = SetCardGame(theme: self.theme)
    }
    
    func newGame() {
        self.model = SetCardGame(theme: self.theme)
    }
    
    func addTheMoreCards() {
        model.AddThreeMoreCards()
    }
    
    func select(_ card: Card) {
        model.select(card)
    }
    
}


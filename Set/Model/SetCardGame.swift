//
//  SetCardGame.swift
//  Set
//
//  Created by Kate Sychenko on 01.04.2022.
//


import Foundation

struct SetCardGame {
    
    private(set) var deck: [Card]
    private(set) var numberOfCardPresented: Int
    
    private var selectedIndicies: [Int]

    
    
    /*
     former selectedIndices get formula:
     
     
     let selectedCards = deck.filter( { $0.isPresented } )
     var selectedIndices = [Int]()
     for index in deck.indices {
         for secondIndex in selectedCards.indices {
             if deck[index].id == selectedCards[secondIndex].id {
                 selectedIndices.append(index)
             }
             
         }
     }
     return selectedIndices
     
     */
    
    var firstSelectedIndex: Int? { selectedIndicies.first }
    var secondSelectedIndex: Int? { selectedIndicies[1] }
    var thirdSelectedIndex: Int? { selectedIndicies[2] }
    
    init(theme: Theme) {
        // indecies starts from 0. To have 12 cards in the beggining you need 0-11 indecies
        numberOfCardPresented = 11
        deck = []
        selectedIndicies = []
        
        for numberOfShape in theme.numberOfShape {
            for shape in theme.shape {
                for shading in theme.shading {
                    for color in theme.color {
                        deck.append(Card(
                            numberOfShape: numberOfShape,
                            shape: shape,
                            shading: shading,
                            color: color))
                    }
                }
            }
        }
                   deck.shuffle()
        for index in 0...numberOfCardPresented {
            deck[index].isPresented = true
        }
    }
    
    
    
    mutating func select (_ card: Card) {
        if let index = deck.firstIndex(where: { $0.id == card.id } ) {
            if deck[index].isSelected {
                deck[index].isSelected = false
                selectedIndicies.removeAll(where: { $0 == index } )
            } else {
                deck[index].isSelected = true
                selectedIndicies.append(index)
            }
            
            if selectedIndicies.count == 3 {
                checkCardsForMatch(firstSelectedIndex!, secondSelectedIndex!, thirdSelectedIndex!)
            }
        }
        
    }
    
    private func checkIfNumberOfShapeMatchForCardsIndexies(_ firstCardIndex: Int, _ secondCardIndex: Int, _ thirdCardIndex: Int) -> Bool {
        if (deck[firstCardIndex].numberOfShape == deck[secondCardIndex].numberOfShape) &&
            (deck[firstCardIndex].numberOfShape  == deck[thirdCardIndex].numberOfShape) &&
            (deck[secondCardIndex].numberOfShape == deck[thirdCardIndex].numberOfShape) ||
            (deck[firstCardIndex].numberOfShape != deck[secondCardIndex].numberOfShape) &&
            (deck[firstCardIndex].numberOfShape != deck[thirdCardIndex].numberOfShape) &&
            (deck[secondCardIndex].numberOfShape != deck[thirdCardIndex].numberOfShape) { return true }
        return false
    }
    
    private func checkIfShadingMatchForCardsIndexies(_ firstCardIndex: Int, _ secondCardIndex: Int, _ thirdCardIndex: Int) -> Bool {
        if (deck[firstCardIndex].shading == deck[secondCardIndex].shading) &&
            (deck[firstCardIndex].shading  == deck[thirdCardIndex].shading) &&
            (deck[secondCardIndex].shading == deck[thirdCardIndex].shading) ||
            (deck[firstCardIndex].shading != deck[secondCardIndex].shading) &&
            (deck[firstCardIndex].shading != deck[thirdCardIndex].shading) &&
            (deck[secondCardIndex].shading != deck[thirdCardIndex].shading) { return true }
        return false
    }
    
    private func checkIfColorMatchForCardsIndexies(_ firstCardIndex: Int, _ secondCardIndex: Int, _ thirdCardIndex: Int) -> Bool {
        if (deck[firstCardIndex].color == deck[secondCardIndex].color) &&
            (deck[firstCardIndex].color  == deck[thirdCardIndex].color) &&
            (deck[secondCardIndex].color == deck[thirdCardIndex].color) ||
            (deck[firstCardIndex].color != deck[secondCardIndex].color) &&
            (deck[firstCardIndex].color != deck[thirdCardIndex].color) &&
            (deck[secondCardIndex].color != deck[thirdCardIndex].color) { return true }
        return false
    }
    
    private func checkIfShapeMatchForCardsIndexies(_ firstCardIndex: Int, _ secondCardIndex: Int, _ thirdCardIndex: Int) -> Bool {
        if (deck[firstCardIndex].shape == deck[secondCardIndex].shape) &&
            (deck[firstCardIndex].shape  == deck[thirdCardIndex].shape) &&
            (deck[secondCardIndex].shape == deck[thirdCardIndex].shape) ||
            (deck[firstCardIndex].shape != deck[secondCardIndex].shape) &&
            (deck[firstCardIndex].shape != deck[thirdCardIndex].shape) &&
            (deck[secondCardIndex].shape != deck[thirdCardIndex].shape) { return true }
        return false
    }
    
    
    mutating func checkCardsForMatch(_ firstCardIndex: Int, _ secondCardIndex: Int, _ thirdCardIndex: Int) {
        if checkIfNumberOfShapeMatchForCardsIndexies(firstCardIndex, secondCardIndex, thirdCardIndex),
           checkIfColorMatchForCardsIndexies(firstCardIndex, secondCardIndex, thirdCardIndex),
           checkIfShadingMatchForCardsIndexies(firstCardIndex, secondCardIndex, thirdCardIndex),
           checkIfShapeMatchForCardsIndexies(firstCardIndex, secondCardIndex, thirdCardIndex) {
            cardsMatched(firstCardIndex, secondCardIndex, thirdCardIndex)
        } else {
            deck[firstCardIndex].isSelected = false
            deck[secondCardIndex].isSelected = false
            selectedIndicies.removeAll(where: { $0 == firstCardIndex } )
            selectedIndicies.removeAll(where: { $0 == secondCardIndex } )
        }
    }
    
    
    
    mutating func cardsMatched (_ firstCardIndex: Int, _ secondCardIndex: Int, _ thirdCardIndex: Int) {
        selectedIndicies.removeAll(where: { $0 == firstCardIndex } )
        selectedIndicies.removeAll(where: { $0 == secondCardIndex } )
        selectedIndicies.removeAll(where: { $0 == thirdCardIndex } )
        deck[firstCardIndex].isPresented = false
        deck[secondCardIndex].isPresented = false
        deck[thirdCardIndex].isPresented = false
        
        //TODO: implement logic when selectedIndices determinates card's isSelected propertry
        
        AddThreeMoreCards()
    }
    
    mutating func AddThreeMoreCards() {
        if numberOfCardPresented < 78 {
            for index in 1...3 {
                //TODO: write a logic when 3 not shown cards are added to the view
                deck[numberOfCardPresented + index].isPresented = true
            }
            numberOfCardPresented += 3
        }
    }
}





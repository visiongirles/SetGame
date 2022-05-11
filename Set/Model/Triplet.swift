//
//  Triplet.swift
//  Set
//
//  Created by Kate Sychenko on 11.04.2022.
//

import Foundation

struct Triplet {
    
    let firstCard: Card?
    let secondCard: Card?
    let thirdCard: Card?
    
    init() {
        self.firstCard = nil
        self.secondCard = nil
        self.thirdCard = nil
    }
    
    init(_ firstCard: Card?, _ secondCard: Card?, _ thirdCard: Card?) {
        self.firstCard = firstCard ?? nil
        self.secondCard = secondCard ?? nil
        self.thirdCard = thirdCard ?? nil
    }
}

//
//  Card.swift
//  Set
//
//  Created by Kate Sychenko on 11.04.2022.
//

import Foundation

struct Card: Identifiable, Hashable {
    let id = UUID()
    let numberOfShape: Theme.NumberOfShapeType
    let shape: Theme.ShapeType
    let shading: Theme.ShadingType
    let color: Theme.ColorType
    var isSelected: Bool = false
    var isMatched: Bool = false
    var isPresented: Bool = false
}

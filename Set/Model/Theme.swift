//
//  Theme.swift
//  Set
//
//  Created by Kate Sychenko on 01.04.2022.
//

import Foundation

struct Theme {
    
    let numberOfShape: [NumberOfShapeType]
    let shape: [ShapeType]
    let shading: [ShadingType]
    let color: [ColorType]
        
    static let classicTheme = Theme(
        numberOfShape: [NumberOfShapeType.one, NumberOfShapeType.two, NumberOfShapeType.three],
        shape: [ShapeType.squiggle, ShapeType.diamond, ShapeType.oval],
        shading: [ShadingType.solid, ShadingType.open, ShadingType.striped],
        color: [ColorType.green, ColorType.blue, ColorType.red])
    
    enum ColorType: CaseIterable {
        case green, blue, red
    }
    
    enum ShadingType: Double, CaseIterable {
        case solid = 1
        case striped = 0.1
        case open = 0
    }
    
    enum NumberOfShapeType: Int, CaseIterable {
        case one = 1, two, three
    }
    
    enum ShapeType: CaseIterable {
        case diamond, squiggle, oval
        
    }
        
}

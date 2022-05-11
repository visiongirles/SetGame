//
//  Squiggle.swift
//  Set
//
//  Created by Kate Sychenko on 01.04.2022.
//

import Foundation
import SwiftUI

struct Squiggle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let start = CGPoint(x: rect.minX, y: rect.maxY * 1/4)
        let point1 = CGPoint(x: rect.midX, y: rect.maxY * 1/4)
        let point2 = CGPoint(x: rect.maxX, y: rect.maxY * 1/4)
        let point3 = CGPoint(x: rect.maxX, y: rect.maxY * 3/4)
        let point4 = CGPoint(x: rect.midX, y: rect.maxY * 3/4)
        let point5 = CGPoint(x: rect.minX, y: rect.maxY * 3/4)
        
        let control1 = CGPoint(x: rect.maxX * 1/4, y: rect.minY)
        let control2 = CGPoint(x: rect.maxX * 3/4, y: rect.midY)
        let control3 = CGPoint(x: rect.maxX * 3/4, y: rect.maxY)
        let control4 = CGPoint(x: rect.maxX * 1/4, y: rect.midY)
        
        path.move(to: start)
        path.addQuadCurve(to: point1, control: control1)
        path.addQuadCurve(to: point2, control: control2)
        path.addLine(to: point3)
        path.addQuadCurve(to: point4, control: control3)
        path.addQuadCurve(to: point5, control: control4)
        path.addLine(to: start)

        return path
    }
    
    
}

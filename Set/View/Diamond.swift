//
//  Diamond.swift
//  Set
//
//  Created by Kate Sychenko on 01.04.2022.
//

import Foundation
import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let start = CGPoint(x: rect.minX, y: rect.midY)
        
        path.move(to: start)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: start)
        
        return path
    }
    
}

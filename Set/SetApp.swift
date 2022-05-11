//
//  SetApp.swift
//  Set
//
//  Created by Kate Sychenko on 01.04.2022.
//

import SwiftUI

@main
struct SetApp: App {
     private let viewModel = ClassicSetCardGameViewModel()

    var body: some Scene {
        WindowGroup {
            ClassicSetCardGameView(viewModel: viewModel)
        }
    }
}

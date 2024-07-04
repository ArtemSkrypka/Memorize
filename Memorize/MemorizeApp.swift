//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Artem Skrypka on 07.06.2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemorizeGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(viewModel: game)
        }
    }
}

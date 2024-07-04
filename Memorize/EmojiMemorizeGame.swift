//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Artem Skrypka on 19.06.2024.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    // Free init is used here implicitly
    private static let emojis = ["🍎","🥐","🥗","🍔","🍮","🍙","🍱"]
    
    private static func createMemorizeGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 7) { pairIndex in
            guard emojis.indices.contains(pairIndex) else {
                return "‽"
            }
            return emojis[pairIndex]
        }
    }
    
    @Published var game = createMemorizeGame()
    
    var cards: [MemorizeGame<String>.Card] {
        return game.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemorizeGame<String>.Card){
        game.choose(card)
    }
    
    func shuffle (){
        game.shuffle()
    }
}

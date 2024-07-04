//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Artem Skrypka on 19.06.2024.
//

import Foundation

struct MemorizeGame<CardContent> where CardContent: Equatable{
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        // Fill a card
       
        for  pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter {index in cards[index].isFaceUp}.only
        }
        set {
            cards.indices.forEach {cards[$0].isFaceUp = (newValue  == $0)}
        }
    }
    
    mutating func choose(_ card: Card){
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[choosenIndex].isFaceUp && !cards[choosenIndex].isMatched{
                if let potentialMatch = indexOfOneAndOnlyFaceUpCard {
                    if cards[choosenIndex].content == cards[potentialMatch].content{
                        cards[choosenIndex].isMatched = true
                        cards[potentialMatch].isMatched = true
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = choosenIndex
                }
                cards[choosenIndex].isFaceUp = true
                
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        var id: String
    }
    
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

//
//  EmojiMemorizeGameView.swift
//  Memorize
//
//  Created by Artem Skrypka on 07.06.2024.
//

import SwiftUI
struct EmojiMemorizeGameView: View {
    @ObservedObject var viewModel: EmojiMemorizeGame
    var body: some View {
        VStack{
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button(action: viewModel.shuffle, label: {
                Text("Suffle")
            })
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }
}


struct CardView: View {
    let card: MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let baseRectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 10)
                      
            Group{
                baseRectangle.fill(.white)
                baseRectangle.strokeBorder(lineWidth: 2)
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            baseRectangle.fill(.orange).opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isMatched ? 0 : 1)
        
    }
}


#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame())
}

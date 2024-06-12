//
//  ContentView.swift
//  Memorize
//
//  Created by Artem Skrypka on 07.06.2024.
//

import SwiftUI
struct ContentView: View {
    var emojis: [String] = ["🫥", "🤯", "🫣", "🥱", "🙃", "😍", "😎", "😇"]
    @State var cardsCount = 4
    var body: some View {
        VStack{
            cards
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String, text: String) -> some View {
        Button(action: {
            cardsCount += offset
        }, label: {
            Image(systemName: symbol)
            Text(text)
        }).font(.title2).disabled(cardsCount + offset < 1 || cardsCount + offset > emojis.count)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach( 0..<cardsCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill", text: "Remove Card")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill", text: "Add Card")
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardAdder
            cardRemover
        }
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack{
            let baseRectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 10)
            Group{
                baseRectangle.fill(.orange)
                baseRectangle.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            baseRectangle.fill(.orange).opacity(isFaceUp ? 0 : 1)
            
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}

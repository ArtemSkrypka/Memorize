//
//  EmojiMemorizeGameView.swift
//  Memorize
//
//  Created by Artem Skrypka on 07.06.2024.
//

import SwiftUI
struct EmojiMemorizeGameView: View {
    @State var emojis: [String] = []
    @State var appColor: Color = .orange
    var gadgetTheme: [String] = ["⌚️","📱","💻","📺","📼","📀","🖨️","🎥","⌚️","📱","💻","📺","📼","📀","🖨️","🎥"]
    var animalTheme: [String] = ["🐶","🐱","🐼","🐽","🐸", "🐶","🐱","🐼","🐽","🐸", "🦁", "🦁"]
    var foodTheme: [String] = ["🍎","🥐","🥗","🍔","🍮","🍙","🍱","🍎","🥐","🥗","🍔","🍮","🍙","🍱"]
    var body: some View {
        VStack{
            Text("Memorize!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            cards
            Spacer()
            themeChooseAdjust
            
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach( 0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index], cardColor: $appColor)
            }
        }
    }
    
    var animalThemeBtn: some View {
        themeChooserAdjuster(symbol: "hare.circle.fill", text: "Animals", theme: animalTheme, openCardColor: .green)
    }
    
    var foodThemeBtn: some View {
        themeChooserAdjuster(symbol: "fork.knife.circle.fill", text: "Food", theme: foodTheme, openCardColor: .orange)
    }
    
    var gadgetThemeBtn: some View {
        themeChooserAdjuster(symbol: "iphone.gen1.circle.fill", text: "Gadgets", theme: gadgetTheme, openCardColor: .blue)
    }
    
    func themeChanger(to theme: [String], openCardColor color: Color) -> Void {
        emojis = theme.shuffled()
        appColor = color
    }
    
    func themeChooserAdjuster(symbol: String, text: String, theme: [String], openCardColor: Color) -> some View {
        Button(action: {
           themeChanger(to: theme, openCardColor: openCardColor)
        }, label: {
            VStack{
                Image(systemName: symbol).font(.title).imageScale(.large)
                Text(text).font(.caption)
            }
        }).padding()
    }
    
    var themeChooseAdjust: some View {
        HStack{
            animalThemeBtn
            foodThemeBtn
            gadgetThemeBtn
        }
    }
}


struct CardView: View {
    let content: String
    @Binding var cardColor: Color
    @State var isFaceUp = false
    
    var body: some View {
        ZStack{
            let baseRectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 10)
                      
            Group{
                baseRectangle.fill(cardColor)
                baseRectangle.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            baseRectangle.fill(cardColor).opacity(isFaceUp ? 0 : 1)
            
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    EmojiMemorizeGameView(appColor: .orange)
}

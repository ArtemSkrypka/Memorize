//
//  ContentView.swift
//  Memorize
//
//  Created by Artem Skrypka on 07.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
    }
}


struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)
            if isFaceUp {
                Text("🫣").font(.largeTitle)
            }
            
        }
    }
}


#Preview {
    ContentView()
}

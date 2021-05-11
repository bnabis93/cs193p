//
//  ContentView.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/08.
//

import SwiftUI

struct ContentView: View {
    var viewModel : EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding() //MARK : tell every view inside of me to use padding!
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView : View{
    var card : MemoryGame<String>.Card
    
    var body: some View{
        ZStack(content: {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        })
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

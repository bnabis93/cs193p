//
//  EmojiMemoryGameView.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/08.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
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
        GeometryReader(content: { geometry in
            body(for : geometry.size)
        })
    }
    
    
    func body(for size : CGSize) -> some View {
        ZStack(content: {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius:cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        })
        .font(Font.system(size: fontSize(for: size)))
    }
    
    
    let cornerRadius : CGFloat = 10.0
    let edgeLineWidth : CGFloat = 3
    func fontSize(for size : CGSize) -> CGFloat {
        min(size.width, size.height ) * 0.75
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

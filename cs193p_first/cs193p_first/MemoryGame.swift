//
//  MemoryGame.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/11.
//
// MARK : model

import Foundation

struct MemoryGame<CardContent> {
    //해당 model이 무엇을 하는지에 대해 먼저 생각하고 정의하라
    var cards : Array<Card>
    
    func choose(card : Card) -> Void {
        print("card chosen: \(card) ")
    }
    
    //MARK: -init
    init(numberOfPairsOfCards : Int, cardContentFactory : (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex) // non mutate variable (change)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card : Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content : CardContent
        var id : Int // if you use identifiable
    }
    
}

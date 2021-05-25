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
    
    mutating func choose(card : Card) -> Void {
        // function argument는 기본적으로 let으로 취급된다. 들어올때 copy되서 들어온다
        print("card chosen: \(card) ")
        let choosenIndex : Int = cards.firstIndex(matching: card)
        self.cards[choosenIndex].isFaceUp = !self.cards[choosenIndex].isFaceUp //self itself immutatable....;;
    }
    
    //MARK: -init
    init(numberOfPairsOfCards : Int, cardContentFactory : (Int) -> CardContent) { //init is implicity mutating
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

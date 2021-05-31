//
//  MemoryGame.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/11.
//
// MARK : model

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    //해당 model이 무엇을 하는지에 대해 먼저 생각하고 정의하라
    var cards : Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard : Int?{
        get { cards.indices.filter {cards[$0].isFaceUp }.only}
        set{
            for index in cards.indices{
                    cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card : Card) -> Void {
        // function argument는 기본적으로 let으로 취급된다. 들어올때 copy되서 들어온다
        if  let choosenIndex = cards.firstIndex(matching: card) , !cards[choosenIndex].isFaceUp , !cards[choosenIndex].isMatched{
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentialMatchIndex].content{
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[choosenIndex].isFaceUp = true
            } else{
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
        }
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

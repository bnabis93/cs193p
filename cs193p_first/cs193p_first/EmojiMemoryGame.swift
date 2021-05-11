//
//  EmojiMemoryGame.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/11.
//
// viewModel
// model에서 전달된 정보가 어떻게 그려질지 봐야해서..그런가
// viewModel은 view와 model을 이어주는 portal이다.

import SwiftUI //UI는 언쓸건데 일단 선언함

// 왜 struct 안쓰고 class 사용?
// class는 heap에 존재하고 pointer를 사용하므로 share하기 간단하다.
// 모든 view는 그들의 pointer가 존재함 (class)
// 그 수많은 view들이 viewModel을 포인터를 이용하여 share 할 수 있으므로 class를 사용 한 것
// 1. 집을 하나 생각하고 그 집안에 view들이 잔뜩 살고있다고 상상해보자.
// 2. 그렇디면 이러한 viewModel은 앞문이다.
// 3. 바깥 세상은 Model이다.
// 4. View는 ViewModel을 통하여 Model을 오고간다.
// 5. 모든 view는 같은 집에 있으므로 앞문을 공유하고 있다.
// 6. 모든 pointer들은 다 앞문 (viewModel)을 가르키고 있다.


//set은 문이 닫혀있어도 유리문마냥 투명하게 비춰주는 역할을 한다.
// model 은 EmojiMemoryGame의 접근을 통해서만 바꿀수있지만, 값을 보는건 모두가 가능하게 만들어준다.

// 지금 되게 상속받아 사용하는 느낌임

//func createCardContent(pairIndex : Int) -> String {
//    return "🌊"
//}


class EmojiMemoryGame {
    private var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    // MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: {_ in "🌊"})
    // equal to : cardContentFactory: {(pairIndex : Int ) in return "🌊"}
    //이미 type 다 지정해놔서 type inference 함
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis : Array<String> = ["❄️","🌊","🔥"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count){pairIndex  in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}


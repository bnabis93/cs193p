//
//  cs193p_firstApp.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/08.
//

import SwiftUI

@main
struct cs193p_firstApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

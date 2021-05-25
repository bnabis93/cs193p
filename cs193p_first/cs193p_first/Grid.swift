//
//  Grid.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/25.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
    var items : [Item]
    var viewForItem : (Item) -> ItemView
    
    init(_ items : [Item], viewForItem : (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

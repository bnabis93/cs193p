//
//  ContentView.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            ForEach(0..<4, content : { idx in
                CardView()
            })
        })
        .padding() //MARK : tell every view inside of me to use padding!
        .foregroundColor(Color.black)
        .background(Color.white)
        .font(Font.largeTitle)
    }
}

struct CardView : View{
    var isFaceUp : Bool = true
    
    var body: some View{
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 10.0)
                Text("👻")
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            }
        })
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

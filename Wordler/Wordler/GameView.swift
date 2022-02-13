//
//  ContentView.swift
//  Wordler
//
//  Created by MATHEW DENNY on 12/2/22.
//

import SwiftUI

struct GameView: View {
    @State var t0 = ""
    @State var t1 = ""
    @State var t2 = ""
    @State var t3 = ""
    @State var t4 = ""
    @State var word: String = ""

    var body: some View {
        VStack {
            WordView(word: $word)
//            WordView(word: $word)
//            WordView(word: $word)
//            WordView(word: $word)
//            WordView(word: $word)
//            WordView(word: $word)
        }
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

//
//  WordView.swift
//  Wordler
//
//  Created by MATHEW DENNY on 13/2/22.
//

import SwiftUI
struct WordView: View {

    @State var t0 = ""
    @State var t1 = ""
    @State var t2 = ""
    @State var t3 = ""
    @State var t4 = ""

    @Binding var word: String

    var body: some View {
        VStack {
            HStack {
                LetterView(letter: $t0)
                LetterView(letter: $t1)
                LetterView(letter: $t2)
                LetterView(letter: $t3)
                LetterView(letter: $t4)
            }
        }
        .padding()
    }
}

struct WordView_Previews: PreviewProvider {
    @State static var word: String = "WATER"
    static var previews: some View {
        WordView(word: $word)
    }
}

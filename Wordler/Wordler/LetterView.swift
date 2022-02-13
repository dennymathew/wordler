//
//  LetterView.swift
//  Wordler
//
//  Created by MATHEW DENNY on 13/2/22.
//

import SwiftUI
struct LetterView: View {

    @Binding var letter: String

    var body: some View {
        TextField("", text: $letter)
            .font(.body)
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .border(Color.black)
    }
}

// MARK: Binding text limit
class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }

    let characterLimit: Int

    init(characterLimit: Int) {
        self.characterLimit = characterLimit
    }
}

struct LetterView_Previews: PreviewProvider {
    @State static var text: String = "S"
    static var previews: some View {
        LetterView(letter: $text)
    }
}


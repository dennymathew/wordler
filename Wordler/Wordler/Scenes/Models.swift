//
//  Models.swift
//  Wordler
//
//  Created by MATHEW DENNY on 13/2/22.
//

import Foundation
struct Letter {

    var value: String
    var status: LetterStatus

    init(
        _ value: String,
        status: LetterStatus = .unknown
    ) {
        self.value = value.lowercased()
        self.status = status
    }
}

enum LetterStatus {
    case perfect // Green
    case promising // Yellow
    case bad // Grey
    case unknown
}

struct Word {

    var letters: [Letter]

    init(_ string: String) {
        letters = string.map({ Letter(String($0)) })
    }

    mutating func updatePosition(_ position: Int, with letter: Letter) {
        guard letters.indices.contains(position) else { return }
        letters[position] = letter
    }
}

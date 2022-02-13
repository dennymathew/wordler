//
//  Analyser.swift
//  Wordler
//
//  Created by MATHEW DENNY on 13/2/22.
//

import Foundation
class Analyser {
    var currentWord: Word
    var good: String = Constants.allowedCharacters
    var mustHave: [String] = []

    init(_ word: Word) {
        currentWord = word
    }

    func markBad(_ character: String) {
        good.removeAll(where: { character == String($0) })
    }

    func markMustHave(_ character: String) {
        mustHave.append(character)
    }

    func updateWord(_ word: Word) {
        currentWord = word
        word.letters.forEach { letter in
            switch letter.status {
            case .bad:
                markBad(letter.value)
            case .promising:
                markMustHave(letter.value)
            default:
                break
            }
        }
    }

    func getRules() -> String {
        var rules: String = ""
        for position in 0...4 {
            rules.append(getRule(for: position))
        }
        return rules
    }

    private func getRule(for position: Int) -> String {
        let letter = currentWord.letters[position]
        switch letter.status {
        case .perfect:
            return letter.value
        case .promising:
            var good = self.good
            good.removeAll(where: { String($0) == letter.value })
            return "[\(good)]"
        case .bad:
            return "[\(good)]"
        case .unknown:
            return ""
        }
    }
}

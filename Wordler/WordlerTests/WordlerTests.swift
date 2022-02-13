//
//  WordlerTests.swift
//  WordlerTests
//
//  Created by MATHEW DENNY on 12/2/22.
//

import XCTest
@testable import Wordler

class WordlerTests: XCTestCase {
    func testSomething() {
        let analyser = Analyser(.init("rosin"))
        var word = analyser.currentWord
        word.updatePosition(0, with: .init("r", status: .perfect))
        word.updatePosition(1, with: .init("o", status: .perfect))
        word.updatePosition(2, with: .init("s", status: .bad))
        word.updatePosition(3, with: .init("i", status: .perfect))
        word.updatePosition(4, with: .init("n", status: .perfect))
        analyser.updateWord(word)
        let rules = analyser.getRules()
        getWords(rules, mustHave: analyser.mustHave) { words in
            print(words)
        }
        sleep(4)
    }

    func getWords(_ pattern: String, mustHave: [String], matchingWords: @escaping (([String]) -> Void)) {
        let client = APIClient<RequestModel, ResponseModel>()
        var requestModel = RequestModel(letters: 5, limit: 10000, page: 1, frequencymin: 3)
        requestModel.letterPattern = pattern
        client.request("", parameters: requestModel) { model in
            var words = model.results?.data ?? []
            if !mustHave.isEmpty {
                mustHave.forEach { letter in
                    words = words.filter({ $0.contains(letter) })
                }
            }
            print(words)
            matchingWords(words)
        } failure: { error in
            print(error.localizedDescription)
            matchingWords([])
        }
    }
}

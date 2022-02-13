//
//  ViewModel.swift
//  Wordler
//
//  Created by MATHEW DENNY on 13/2/22.
//

import Foundation
class ViewModel {

    var analyser: Analyser

    init() {
        analyser = Analyser(.init("crane"))
    }
}

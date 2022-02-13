//
//  ResponseModel.swift
//  Wordler
//
//  Created by MATHEW DENNY on 13/2/22.
//

import Foundation

struct ResponseModel: Decodable {
    var results: WDResult?
}

struct WDResult: Decodable {
    var data: [String]?
}

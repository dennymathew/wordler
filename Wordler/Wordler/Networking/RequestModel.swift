//
//  RequestModel.swift
//  Wordler
//
//  Created by MATHEW DENNY on 13/2/22.
//

import Foundation
struct RequestModel: Encodable {
    var letters: Int?
    var letterPattern: String?
    var limit: Int?
    var page: Int?
    var frequencymin: Int?
}

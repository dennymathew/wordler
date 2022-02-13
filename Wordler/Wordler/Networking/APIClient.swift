//
//  APIClient.swift
//  Wordler
//
//  Created by MATHEW DENNY on 12/2/22.
//

import Alamofire

final class APIClient<Model: Encodable, Response: Decodable> {

    private var headers: HTTPHeaders = {
        .init([
            Constants.hostKey: Constants.hostValue,
            Constants.apiKeyKey: Constants.apiKeyValue
        ])
    }()

    func request(
        _ url: String,
        method: HTTPMethod = .get,
        parameters: Model? = nil,
        success: @escaping (Response) -> Void,
        failure: @escaping (Error) -> Void
    ) {
        let url = Constants.baseUrl
        AF.request(
            url,
            method: method,
            parameters: parameters,
            encoder: URLEncodedFormParameterEncoder(destination: .queryString),
            headers: headers
        ).responseDecodable(of: Response.self) { response in
            switch response.result {
            case let .success(model):
                success(model)
            case let .failure(error):
                failure(error)
            }
        }
    }
}

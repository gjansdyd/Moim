//
//  RequestInterceptor.swift
//  Moim
//
//  Created by mun on 2023/03/31.
//

import Alamofire

final class RequestInterceptor: Alamofire.RequestInterceptor {
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var req = urlRequest
//        req.setValue("Bearer " + UserData.accessToken, forHTTPHeaderField: "Authorization")
        completion(.success(req))
    }
}

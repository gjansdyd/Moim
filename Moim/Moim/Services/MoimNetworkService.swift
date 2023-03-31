//
//  MoimNetworkService.swift
//  Moim
//
//  Created by mun on 2023/03/31.
//

import Alamofire

var defaultSession: Session {
    let interceptor = RequestInterceptor()
#if DEBUG
    return Alamofire.Session(interceptor: interceptor, eventMonitors: [NetworkEventMonitor()])
#else
    return Alamofire.Session(interceptor: interceptor)
#endif
}


class MoimNetworkService {
    static let session = defaultSession
    
    func loginOrSignIn(userId: String, completion: @escaping (MoimUserViewModel?) -> Void) {
        let urlStr = NetworkType.baseURL.rawValue + NetworkType.user.rawValue + userId
        MoimNetworkService.session.request(urlStr, method: .post,
                                           encoding: URLEncoding.default)
        .responseDecodable(of: ResponseResult<MoimUserModel>.self) { response in
            guard let value = response.value,
                  value.status == 200,
                  let userModel = value.payload else {
                completion(nil) //NETWORK에러
                return
            }
            
            completion(MoimUserViewModel(moimUserModel: userModel))
        }
    }
}

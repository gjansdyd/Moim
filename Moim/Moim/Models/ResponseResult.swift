//
//  ResponseResult.swift
//  Moim
//
//  Created by mun on 2023/03/31.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    let status: Int?
    let code: Int?
    let payload: T?
    
    enum CodingKeys: CodingKey {
        case status, code, payload
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? nil
        code = (try? values.decode(Int.self, forKey: .code)) ?? nil
        payload = (try? values.decode(T.self, forKey: .payload)) ?? nil
    }
}

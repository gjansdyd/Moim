//
//  Extensions+Data.swift
//  Moim
//
//  Created by mun on 2023/03/31.
//

import Foundation

extension Data {
    var uniCodeToStr: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let uniCodeToStr = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return uniCodeToStr as String
    }
}

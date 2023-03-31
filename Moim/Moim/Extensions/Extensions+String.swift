//
//  Extensions+String.swift
//  Moim
//
//  Created by mun on 2023/03/31.
//

import Foundation
extension String {
    func substring(to: Int) -> String {
        let toIndex = utf16.index(startIndex, offsetBy: to)
        return String(self[..<toIndex])
    }
}

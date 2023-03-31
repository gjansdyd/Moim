//
//  MoimUser.swift
//  Moim
//
//  Created by mun on 2023/03/31.
//

import Foundation

struct MoimUserModel: Codable {
    let userId: String
    let belongings: [String]?    // 속한 모임 ID Array
    let bookMarks: [String]?    // 저장한 책
    let wantToBelongings: [String]? // 지원한 모임 ID Array
}

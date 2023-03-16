//
//  Colors.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit

enum Colors: String {
    var val: UIColor {
        return UIColor(hex: self.rawValue) ?? .clear
    }
    
    case black="0x000000"
    case white="0xFFFFFF"
}

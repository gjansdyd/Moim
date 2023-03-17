//
//  Colors.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit

enum Colors: Int {
    var val: UIColor {
        return UIColor(rgb: self.rawValue)
    }
    
    case black=0x000000
    case white=0xFFFFFF
}

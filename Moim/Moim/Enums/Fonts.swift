//
//  Fonts.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit

enum Fonts {
    case heavy
    case bold
    case medium
    case light
    
    func get(size: Double) -> UIFont {
        let weight: UIFont.Weight
        switch self {
        case .heavy:
            weight = .heavy
        case .bold:
            weight = .bold
        case .medium:
            weight = .medium
        case .light:
            weight = .light
        }
        return .systemFont(ofSize: size,
                           weight: weight)
    }
}

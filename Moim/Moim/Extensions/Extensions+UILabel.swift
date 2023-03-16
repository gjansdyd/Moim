//
//  Extensions+UILabel.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit

extension UILabel {
    func setTitle(title: String? = nil,
                  font: UIFont? = nil,
                  color: UIColor? = nil,
                  backColor: UIColor? = nil) {
        if let title = title {
            self.text = title
        }
        if let font = font {
            self.font = font
        }
        if let color = color {
            self.textColor = color
        }
        if let backColor = color {
            self.backgroundColor = backColor
        }
    }
}

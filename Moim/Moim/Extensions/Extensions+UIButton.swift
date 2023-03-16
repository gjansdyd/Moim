//
//  Extensions+UIButton.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit

extension UIButton {
    func setTitle(title: String?,
                  font: UIFont?,
                  color: UIColor?,
                  backColor: UIColor?) {
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        if let font = font {
            self.titleLabel?.font = font
        }
        if let color = color {
            self.setTitleColor(color, for: .normal)
        }
        if let backColor = backColor {
            self.backgroundColor = backColor
        }
    }
}

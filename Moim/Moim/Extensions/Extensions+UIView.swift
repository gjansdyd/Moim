//
//  Extensions+UIView.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit

extension UIView {
    func addSubViews(_ subViews: UIView...) {
        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}

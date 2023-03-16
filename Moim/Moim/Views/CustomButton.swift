//
//  CustomButton.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit
import SnapKit

class CustomButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    init<T>(_ vm: T) {
        super.init(frame: .zero)
        setUI(vm)
    }
    internal func setUI() { }
    internal func setUI<T>(_ vm: T) { }
}

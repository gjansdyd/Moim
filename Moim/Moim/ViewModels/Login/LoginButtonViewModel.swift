//
//  LoginButtonViewModel.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import Foundation

class LoginButtonViewModel {
    var type: LoginType
    var bindClosure: (() -> Void)
    init(type: LoginType,
         bindClosure: @escaping () -> Void) {
        self.type = type
        self.bindClosure = bindClosure
    }
}

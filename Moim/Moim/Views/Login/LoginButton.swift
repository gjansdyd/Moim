//
//  LoginButton.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit
import AuthenticationServices

final class LoginButton: CustomButton {
    override func setUI<T>(_ vm: T) {
        guard let vm = vm as? LoginButtonViewModel
        else { return }

        self.addAction(UIAction { _ in
            vm.bindClosure()
        }, for: .touchUpInside)
        
        let loginImgName = vm.type == .apple ? "AppleLoginButtonImage" : "GoogleLoginButtonImage"
        self.setImage(UIImage(named: loginImgName), for: .normal)
    }
}

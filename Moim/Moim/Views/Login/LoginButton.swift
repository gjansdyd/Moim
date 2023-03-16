//
//  LoginButton.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit
import AuthenticationServices

class LoginButton: CustomButton {
    override func setUI<T>(_ vm: T) {
        guard let vm = vm as? LoginButtonViewModel
        else { return }

        self.addAction(UIAction { _ in
            vm.bindClosure()
        }, for: .touchUpInside)
    }
}

class GoogleLoginButton: LoginButton {
    override func setUI<T>(_ vm: T) {
        super.setUI(vm)
        
        let img = UIImage(named: "GoogleLoginLogo")
        self.setImage(img, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 8, left: -16, bottom: 8, right: 0)
        self.setTitle(title: "Sign in with Google",
                      font: Fonts.bold.get(size: 12),
                      color: .black,
                      backColor: .white)
    }
}

class AppleLoginButton: LoginButton {
    override func setUI<T>(_ vm: T) {
        super.setUI(vm)
        
        let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
        self.addSubview(authorizationButton)
        self.snp.makeConstraints({ make in
            make.top.left.right.bottom.equalTo(self.snp.edges)
        })
        self.backgroundColor = .red
        authorizationButton.isUserInteractionEnabled = false
    }
}

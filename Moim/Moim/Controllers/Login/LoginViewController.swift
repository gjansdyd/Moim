//
//  LoginViewController.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit

class LoginViewController: ViewController {
    override func setUI() {
        super.setUI()
        
        let titleLabel = UILabel()
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(75)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(80)
        })
        titleLabel.setTitle(title: "MOIM",
                            font: Fonts.heavy.get(size: 40),
                            color: Colors.white.val)
        
        let googleVM = LoginButtonViewModel(type: .google,
                                            bindClosure: { [weak self] in
            self?.googleLogin()
        })
        let googleLoginButton = GoogleLoginButton(googleVM)
        
        let appleVM = LoginButtonViewModel(type: .apple,
                                           bindClosure: { [weak self] in
            self?.appleLogin()
        })
        let appleLoginButton = AppleLoginButton(appleVM)
        
        let stackView = UIStackView(arrangedSubviews: [googleLoginButton, appleLoginButton])
        self.view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().inset(20)
            make.width.equalTo(200)
        })
    }
    
    private func googleLogin() {
        print("google login button clicked")
    }
    
    private func appleLogin() {
        print("apple login button clicked")
    }
}

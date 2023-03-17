//
//  LoginViewController.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit
import Lottie

class LoginViewController: ViewController {
    private unowned var animationView: LottieAnimationView!
    
    override func setUI() {
        super.setUI()
        
        let animationView = LottieAnimationView(name: "LoginTitleLogo")
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFill
        animationView.animationSpeed = 2
        animationView.play()
        self.animationView = animationView
        
        let gVM = LoginButtonViewModel(type: .google,
                                       bindClosure: { [weak self] in
            self?.googleLogin()
        })
        let googleLoginButton = LoginButton(gVM)
        let aVM = LoginButtonViewModel(type: .apple,
                                       bindClosure: { [weak self] in
            self?.appleLogin()
        })
        let appleLoginButton = LoginButton(aVM)
        
        let stackView = UIStackView(arrangedSubviews: [googleLoginButton,
                                                       appleLoginButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        let superStackView = UIStackView(arrangedSubviews: [animationView,
                                                            stackView])
        self.view.addSubview(superStackView)
        superStackView.axis = .vertical
        superStackView.spacing = 20
        superStackView.alignment = .fill
        superStackView.distribution = .fillProportionally
        superStackView.snp.makeConstraints({ make in
            make.centerX.centerY.equalToSuperview()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.animationView.stop()
        self.animationView.removeFromSuperview()
        self.animationView = nil
    }
    
    private func googleLogin() {
        print("google login button clicked")
    }
    
    private func appleLogin() {
        print("apple login button clicked")
    }
}

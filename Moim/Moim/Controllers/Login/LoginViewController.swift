//
//  LoginViewController.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit
import Lottie
import GoogleSignIn
import FirebaseCore
import AuthenticationServices

class LoginViewController: ViewController {
    private unowned var animationView: LottieAnimationView!
    
    override func setUI() {
        super.setUI()
        
        let animationView = LottieAnimationView(name: "Moim")
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
        guard let id = FirebaseApp.app()?.options.clientID else { return }
        let clientId = GIDConfiguration(clientID: id)
        GIDSignIn.sharedInstance.signIn(with: clientId,
                                        presenting: self) { signInResult, error in
            //MARK: 서버로부터 userIdentifer던지기
            guard nil != error,
                  let userId = signInResult?.userID else {
                //MARK: 에러가 난 경우 처리?
                return
            }
            
            //MARK: userId 서버에 던진 후 MoimUserModel수신하기
        }
    }
    
    private func appleLogin() {
        print("apple login button clicked")
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}


//MARK: Apple 간편 로그인 시 필요한 extension
extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            
            //MARK: userId 서버에 던진 후 MoimUserModel수신하기
            
        case let passwordCredential as ASPasswordCredential:
            let username = passwordCredential.user
            let password = passwordCredential.password
            
        default:
            break
        }
    }

    //MARK: 애플 로그인 인증 에러
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
    
    //PresentationContext UI를 어디에 띄울지 가장 적합한 뷰 앵커를 반환
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

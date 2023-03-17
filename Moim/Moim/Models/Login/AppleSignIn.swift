//
//  AppleSignIn.swift
//  Moim
//
//  Created by mun on 2023/03/17.
//

import Foundation
import AuthenticationServices

class AppleSignIn {
    static func previousSignIn(completion: @escaping (String?) -> Void) {
        //MARK: KeychainCurrentUserId로 변경필요
        let id = "keychainCurrentUserId"
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: id) { (credentialState, error) in
            switch credentialState {
            case .authorized:
                completion(id)
            case .revoked, .notFound:
                completion(nil)
            default:
                break
            }
        }
    }
}

//
//  LaunchViewController.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit

// MARK: 최초 RootViewController이며
// MARK: RootViewController를 실제 결정하는 곳
class LaunchViewController: ViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 로그인이 되어 있다 && 로그인이 유효하다 -> 메인
        // 둘 중 하나만 아님 -> 로그인
        
        //MARK: 일단 로그인 화면 구현 2023.03.16
        presentingModalFullScreen(LoginViewController())
    }
}

//
//  ViewController.swift
//  Moim
//
//  Created by mun on 2023/03/16.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    internal func setUI() {
        self.view.backgroundColor = Colors.white.val
    }
    internal func setAdditionalUI() { }
    internal func setAdditionalUI<T>(_ value: T) { }
    
    internal func presentingModalFullScreen(_ vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

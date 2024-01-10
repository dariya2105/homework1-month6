//
//  SplashViewController.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sessionDate = UserSessionManager.shared.getSession(),
        sessionDate > Date() {
            let vc = InfoViewController()
            present(vc, animated: true)
        } else {
            let vc = UserAutorizationViewController()
            present(vc, animated: true)
        }
    }

}

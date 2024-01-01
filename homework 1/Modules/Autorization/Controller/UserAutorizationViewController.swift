//
//  ViewController.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import UIKit

class UserAutorizationViewController: UIViewController {
    
    private var nameTF = MakerView.shared.makeTF(placeholder: "Name")
    
    private let surnameTF = MakerView.shared.makeTF(placeholder: "Surname")
    
    private let numberTF = MakerView.shared.makeTF(placeholder: "Phone Number")
    
    private let signInButton = MakerView.shared.makeButton(setTitle: "Sign In",
                                                           setTitleColor: .black,
                                                           backgroundColor: .systemOrange,
                                                           cornerRadius: 18,
                                                           fontSize: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    private func initUI() {
        view.addSubview(nameTF)
        setupConstraintsForNameTF()
        
        view.addSubview(surnameTF)
        setupConstraintsForSurnameTF()
        
        view.addSubview(numberTF)
        setupConstraintsForNumberTF()
        
        view.addSubview(signInButton)
        setupConstraintsForSignInButton()
    }
    
    private func setupConstraintsForNameTF() {
        NSLayoutConstraint.activate([
            nameTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            nameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func setupConstraintsForSurnameTF() {
        NSLayoutConstraint.activate([
            surnameTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 20),
            surnameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            surnameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            surnameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupConstraintsForNumberTF() {
        NSLayoutConstraint.activate([
            numberTF.topAnchor.constraint(equalTo: surnameTF.bottomAnchor, constant: 20),
            numberTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            numberTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            numberTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupConstraintsForSignInButton() {
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: numberTF.bottomAnchor, constant: 40),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        signInButton.addTarget(self, action: #selector(signInBtnTapped), for: .touchUpInside)
    }
    
    @objc
    private func signInBtnTapped() {
        if validated() {
            let person = PersonModel(name: nameTF.text,
                                     surname: surnameTF.text ?? "",
                                     phoneNumber: numberTF.text ?? "")
            let vc = InfoViewController()
            vc.person = person
            present(vc, animated: true)
            UserSessionManager.shared.saveUserSession()
        } 
    }
    
    private func validated() -> Bool {
        guard let name = nameTF.text,
              let surname = surnameTF.text,
              !name.isEmpty,
              !surname.isEmpty
        else {
            signInButton.isEnabled = false
            return false
        }
        signInButton.isEnabled = true
        return true
    }
}


//
//  ViewController.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import UIKit

class UserAutorizationViewController: UIViewController {
    
    private let nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Name"
        view.layer.cornerRadius = 18
        view.layer.borderColor = UIColor(red: 0.012, green: 0.012, blue: 0.012, alpha: 1).cgColor
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let surnameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Surname"
        view.layer.cornerRadius = 18
        view.layer.borderColor = UIColor(red: 0.012, green: 0.012, blue: 0.012, alpha: 1).cgColor
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let numberTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Phone Number"
        view.layer.cornerRadius = 18
        view.layer.borderColor = UIColor(red: 0.012, green: 0.012, blue: 0.012, alpha: 1).cgColor
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let signInButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 18
        view.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    private func initUI() {
        view.addSubview(nameTextField)
        setupConstraintsForNameTextField()
        
        view.addSubview(surnameTextField)
        setupConstraintsForSurnameTextField()
        
        view.addSubview(numberTextField)
        setupConstraintsForNumberTextField()
        
        view.addSubview(signInButton)
        setupConstraintsForSignInButton()
    }
    
    private func prefixLabel(textField: UITextField) {
        let prefixLabel = UILabel()
        prefixLabel.text = "   "
        textField.leftView = prefixLabel
        textField.leftViewMode = .always
    }
    
    private func setupConstraintsForNameTextField() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        prefixLabel(textField: nameTextField)
    }
    
    
    private func setupConstraintsForSurnameTextField() {
        NSLayoutConstraint.activate([
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            surnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            surnameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        prefixLabel(textField: surnameTextField)
    }
    
    private func setupConstraintsForNumberTextField() {
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 20),
            numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            numberTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        prefixLabel(textField: numberTextField)
    }
    
    private func setupConstraintsForSignInButton() {
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 40),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        signInButton.addTarget(self, action: #selector(signInBtnTapped), for: .touchUpInside)
    }
    
    private var validated: Bool {
        guard let name = nameTextField.text,
              let surname = surnameTextField.text,
              !name.isEmpty,
              !surname.isEmpty
        else {
            signInButton.isEnabled = false
            return false
        }
        signInButton.isEnabled = true
        return true
    }
    
    @objc
    private func signInBtnTapped() {
        if validated {
            UserSessionManager.shared.saveUserSession(
            PersonModel(
                name: nameTextField.text!,
                surname: surnameTextField.text!,
                phoneNumber: numberTextField.text!
                )
            )
            let vc = InfoViewController()
            present(vc, animated: true)
        }
    }
}

